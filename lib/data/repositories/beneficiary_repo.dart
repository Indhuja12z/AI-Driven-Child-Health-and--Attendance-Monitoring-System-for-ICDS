import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import '../local/isar_service.dart';
import '../models/beneficiary.dart';
import '../models/sync_queue_item.dart';
import 'sync_repo.dart';

class BeneficiaryRepo {
  final IsarService _isar;
  final SyncRepo _syncRepo;
  BeneficiaryRepo(this._isar, this._syncRepo);

  Future<int> add(Beneficiary b) async {
    b.createdAt = DateTime.now();
    b.updatedAt = DateTime.now();
    b.isDirty = true;
    final id = await _isar.putBeneficiary(b);

    await _syncRepo.enqueue(
      target: SyncTarget.beneficiary,
      op: SyncOperation.create,
      localRecordId: id,
      priority: SyncPriority.p2Important,
      payload: _toJson(b, id),
    );
    return id;
  }

  Future<Beneficiary?> getByQr(String qrCode) async {
    return _isar.findBeneficiaryByQr(qrCode);
  }

  Future<List<Beneficiary>> all() async {
    return _isar.allBeneficiaries();
  }

  Future<List<Beneficiary>> byType(BeneficiaryType type) async {
    return _isar.isar.beneficiaries
        .filter()
        .typeEqualTo(type)
        .isDeletedEqualTo(false)
        .findAll();
  }

  Future<int> delete(int id) async {
    return _isar.isar.writeTxn(() async {
      final b = await _isar.isar.beneficiaries.get(id);
      if (b == null) return 0;
      b.isDeleted = true;
      b.isDirty = true;
      b.updatedAt = DateTime.now();
      await _isar.isar.beneficiaries.put(b);

      await _syncRepo.enqueue(
        target: SyncTarget.beneficiary,
        op: SyncOperation.delete,
        localRecordId: id,
        priority: SyncPriority.p2Important,
        payload: {'localId': id},
      );
      return 1;
    });
  }

  Map<String, dynamic> _toJson(Beneficiary b, int id) => {
        'localId': id,
        'centerCode': 'TN-MDU-04', // TODO: settings
        'qrCode': b.qrCode,
        'type': b.type.name,
        'name': b.name,
        'gender': b.gender.name,
        'dateOfBirth': b.dateOfBirth?.toIso8601String(),
        'guardianName': b.guardianName,
        'phoneNumber': b.phoneNumber,
        'aadhaarNumber': b.aadhaarNumber,
        'abhaNumber': b.abhaNumber,
        'lastHeightCm': b.lastHeightCm,
        'lastWeightKg': b.lastWeightKg,
        'lastMuacCm': b.lastMuacCm,
        'lastStatus': b.lastStatus.name,
        'isDeleted': b.isDeleted,
      };
}

final beneficiaryRepoProvider = Provider<BeneficiaryRepo>((ref) {
  return BeneficiaryRepo(isarService, ref.read(syncRepoProvider));
});