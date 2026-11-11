import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import '../local/isar_service.dart';
import '../models/attendance.dart';
import '../models/sync_queue_item.dart';
import 'sync_repo.dart';

class AttendanceRepo {
  final IsarService _isar;
  final SyncRepo _syncRepo;
  AttendanceRepo(this._isar, this._syncRepo);

  Future<int> mark({
    required int beneficiaryId,
    required AttendanceKind kind,
    required VerificationMethod verification,
    String? otpRef,
    String? markedByWorkerId,
  }) async {
    final record = Attendance()
      ..beneficiaryId = beneficiaryId
      ..kind = kind
      ..markedAt = DateTime.now()
      ..verification = verification
      ..otpRef = otpRef
      ..markedByWorkerId = markedByWorkerId
      ..isDirty = true;

    final id = await _isar.isar.writeTxn(
      () => _isar.isar.attendances.put(record),
    );

    // Enqueue for cloud sync
    await _syncRepo.enqueue(
      target: SyncTarget.attendance,
      op: SyncOperation.create,
      localRecordId: id,
      priority: (kind == AttendanceKind.hcm)
          ? SyncPriority.p1Critical
          : SyncPriority.p3Low,
      payload: {
        'localId': id,
        'beneficiaryLocalId': beneficiaryId,
        'centerCode': 'TN-MDU-04', // TODO: read from settings
        'kind': kind.name,
        'markedAt': record.markedAt.toIso8601String(),
        'verification': verification.name,
        'otpRef': otpRef,
        'markedByWorkerId': markedByWorkerId,
      },
    );

    return id;
  }

  Future<List<Attendance>> forBeneficiary(int beneficiaryId) {
    return _isar.isar.attendances
        .filter()
        .beneficiaryIdEqualTo(beneficiaryId)
        .sortByMarkedAtDesc()
        .findAll();
  }

  Future<List<Attendance>> todayByKind(AttendanceKind kind) async {
    final start = DateTime.now();
    final dayStart = DateTime(start.year, start.month, start.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    return _isar.isar.attendances
        .filter()
        .kindEqualTo(kind)
        .markedAtBetween(dayStart, dayEnd)
        .findAll();
  }
}

final attendanceRepoProvider = Provider<AttendanceRepo>((ref) {
  return AttendanceRepo(isarService, ref.read(syncRepoProvider));
});