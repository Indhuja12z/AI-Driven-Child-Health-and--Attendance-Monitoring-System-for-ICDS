import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import '../../core/utils/who_anthro_helper.dart';
import '../local/isar_service.dart';
import '../models/beneficiary.dart';
import '../models/growth_record.dart';
import '../models/sync_queue_item.dart';
import 'sync_repo.dart';
import '../services/ai_service.dart';
import '../models/home_visit.dart';
import '../models/aww_alert.dart';

class GrowthRepo {
  final IsarService _isar;
  final SyncRepo _syncRepo;
  GrowthRepo(this._isar, this._syncRepo);

  Future<int> add({
    required Beneficiary child,
    required double heightCm,
    required double weightKg,
    double? muacCm,
    DateTime? measuredAt,
    String? note,
  }) async {
    if (child.dateOfBirth == null) {
      throw ArgumentError('Beneficiary ${child.id} has no dateOfBirth');
    }

    final when = measuredAt ?? DateTime.now();
    final days = WhoAnthroHelper.daysBetween(child.dateOfBirth!, when);

    double? waz, haz, whz, baz;
    NutritionalStatus status;

    // ---- Compute WHO Z-scores ----
    if (WhoAnthroHelper.isWhoChildRange(days)) {
      waz = await WhoAnthroHelper.waz(
        dateOfBirth: child.dateOfBirth!,
        measuredAt: when,
        weightKg: weightKg,
        gender: child.gender,
      );
      haz = await WhoAnthroHelper.haz(
        dateOfBirth: child.dateOfBirth!,
        measuredAt: when,
        heightCm: heightCm,
        gender: child.gender,
      );
      whz = await WhoAnthroHelper.whz(
        dateOfBirth: child.dateOfBirth!,
        measuredAt: when,
        weightKg: weightKg,
        heightCm: heightCm,
        gender: child.gender,
      );
      status = WhoAnthroHelper.classifyChild(
        waz: waz,
        haz: haz,
        whz: whz,
        muacCm: muacCm,
      );
    } else {
      baz = await WhoAnthroHelper.bmiZScore5to6(
        dateOfBirth: child.dateOfBirth!,
        measuredAt: when,
        weightKg: weightKg,
        heightCm: heightCm,
        gender: child.gender,
      );
      status = WhoAnthroHelper.classify5to6(baz);
    }

    final record = GrowthRecord()
      ..beneficiaryId = child.id
      ..heightCm = heightCm
      ..weightKg = weightKg
      ..muacCm = muacCm
      ..measuredAt = when
      ..waz = waz
      ..haz = haz
      ..whz = whz
      ..baz = baz
      ..status = status
      ..note = note
      ..createdAt = DateTime.now();

    // ---- Save to Isar ----
    final id = await _isar.isar.writeTxn(() async {
      child.lastHeightCm = heightCm;
      child.lastWeightKg = weightKg;
      child.lastMuacCm = muacCm;
      child.lastStatus = status;
      child.updatedAt = DateTime.now();
      child.isDirty = true;
      await _isar.isar.beneficiaries.put(child);
      return _isar.isar.growthRecords.put(record);
    });

    print('GROWTH_SAVED: id=$id for child ${child.id}, status=${status.name}');

    // ---- Enqueue growth record for cloud sync ----
    final priority =
        (status == NutritionalStatus.sam || status == NutritionalStatus.mam)
            ? SyncPriority.p1Critical
            : SyncPriority.p2Important;

    await _syncRepo.enqueue(
      target: SyncTarget.growth,
      op: SyncOperation.create,
      localRecordId: id,
      priority: priority,
      payload: {
        'localId': id,
        'beneficiaryLocalId': child.id,
        'beneficiaryQr': child.qrCode,
        'centerCode': 'TN-MDU-04',
        'heightCm': heightCm,
        'weightKg': weightKg,
        'muacCm': muacCm,
        'measuredAt': when.toIso8601String(),
        'waz': waz,
        'haz': haz,
        'whz': whz,
        'baz': baz,
        'status': status.name,
      },
    );
    print('GROWTH_ENQUEUED: growth record');

    // ---- Enqueue beneficiary update (for lastStatus sync) ----
    await _syncRepo.enqueue(
      target: SyncTarget.beneficiary,
      op: SyncOperation.update,
      localRecordId: child.id,
      priority: SyncPriority.p2Important,
      payload: {
        'localId': child.id,
        'centerCode': 'TN-MDU-04',
        'qrCode': child.qrCode,
        'type': child.type.name,
        'name': child.name,
        'gender': child.gender.name,
        'dateOfBirth': child.dateOfBirth?.toIso8601String(),
        'guardianName': child.guardianName,
        'phoneNumber': child.phoneNumber,
        'aadhaarNumber': child.aadhaarNumber,
        'abhaNumber': child.abhaNumber,
        'lastHeightCm': child.lastHeightCm,
        'lastWeightKg': child.lastWeightKg,
        'lastMuacCm': child.lastMuacCm,
        'lastStatus': child.lastStatus.name,
        'isDeleted': child.isDeleted,
      },
    );
    print('GROWTH_ENQUEUED: beneficiary update');

    // ---- Agentic AI (optional, non-blocking failure) ----
    try {
      final ageMonths = days / 30.0;
      print('AI_CALL_START: child=${child.id}, ageMonths=$ageMonths');

      final prediction = await aiService.predict(
        child: child,
        weightKg: weightKg,
        heightCm: heightCm,
        ageMonths: ageMonths,
      );

      print('AI_RESPONSE: $prediction');

      if (prediction != null && prediction['recommended_actions'] is List) {
        final actions = prediction['recommended_actions'] as List;

        for (final action in actions) {
          final type = action['type'] as String?;

          // ---- Home Visit ----
          if (type == 'schedule_home_visit') {
            final prio = action['priority'] as String? ?? 'low';
            final severity = prio == 'high'
                ? VisitSeverity.high
                : prio == 'moderate'
                    ? VisitSeverity.moderate
                    : VisitSeverity.low;

            final dueDays = (action['due_within_days'] as num).toInt();
            final visit = HomeVisit()
              ..beneficiaryId = child.id
              ..reason = VisitReason.growthConcern
              ..status = VisitStatus.due
              ..severity = severity
              ..scheduledFor = when.add(Duration(days: dueDays))
              ..notes = action['reason'] as String?
              ..isDirty = true;

            await _isar.isar.writeTxn(() async {
              await _isar.isar.homeVisits.put(visit);
            });
            print('HOME_VISIT_CREATED: id=${visit.id}, severity=${severity.name}');

            await _syncRepo.enqueue(
              target: SyncTarget.homeVisit,
              op: SyncOperation.create,
              localRecordId: visit.id,
              priority: severity == VisitSeverity.high
                  ? SyncPriority.p1Critical
                  : SyncPriority.p2Important,
              payload: {
                'localId': visit.id,
                'beneficiaryLocalId': child.id,
                'centerCode': 'TN-MDU-04',
                'reason': visit.reason.name,
                'severity': visit.severity.name,
                'status': visit.status.name,
                'scheduledFor': visit.scheduledFor.toIso8601String(),
                'notes': visit.notes,
              },
            );
          }

          // ---- Clinic Referral Alert ----
          if (type == 'notify_clinic') {
            final alert = AwwAlert()
              ..title = 'Clinic Referral Needed'
              ..message = '${child.name} — ${action['reason']}'
              ..action = AlertAction.notifyClinic
              ..beneficiaryId = child.id
              ..createdAt = DateTime.now()
              ..isDirty = true;

            await _isar.isar.writeTxn(() async {
              await _isar.isar.awwAlerts.put(alert);
            });
            print('AWW_ALERT_CREATED: id=${alert.id}');
          }
        }
      }
    } catch (e, st) {
      print('AI_PREDICTION_FAILED: $e');
      print('AI_STACK: $st');
    }

    return id;
  }

  Future<List<GrowthRecord>> forBeneficiary(int beneficiaryId) {
    return _isar.isar.growthRecords
        .filter()
        .beneficiaryIdEqualTo(beneficiaryId)
        .sortByMeasuredAt()
        .findAll();
  }

  Future<GrowthRecord?> latestFor(int beneficiaryId) {
    return _isar.isar.growthRecords
        .filter()
        .beneficiaryIdEqualTo(beneficiaryId)
        .sortByMeasuredAtDesc()
        .findFirst();
  }
}

final growthRepoProvider = Provider<GrowthRepo>((ref) {
  return GrowthRepo(isarService, ref.read(syncRepoProvider));
});