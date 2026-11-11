import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import '../local/isar_service.dart';
import '../models/attendance.dart';
import '../models/sync_queue_item.dart';
import '../models/thr_transaction.dart';
import 'sync_repo.dart';

class ThrRepo {
  final IsarService _isar;
  final SyncRepo _syncRepo;
  ThrRepo(this._isar, this._syncRepo);

  Future<int> provide({
    required int beneficiaryId,
    required ThrItem item,
    required VerificationMethod verification,
    String? quantityNote,
    String? otpRef,
    String? photoPath,
    String? providedByWorkerId,
  }) async {
    final record = ThrTransaction()
      ..beneficiaryId = beneficiaryId
      ..item = item
      ..quantityNote = quantityNote
      ..providedAt = DateTime.now()
      ..verification = verification
      ..otpRef = otpRef
      ..photoPath = photoPath
      ..providedByWorkerId = providedByWorkerId
      ..isDirty = true;

    final id = await _isar.isar.writeTxn(
      () => _isar.isar.thrTransactions.put(record),
    );

    // Enqueue for cloud sync
    await _syncRepo.enqueue(
      target: SyncTarget.thr,
      op: SyncOperation.create,
      localRecordId: id,
      priority: SyncPriority.p2Important,
      payload: {
        'localId': id,
        'beneficiaryLocalId': beneficiaryId,
        'centerCode': 'TN-MDU-04', // TODO: read from settings
        'item': item.name,
        'quantityNote': quantityNote,
        'providedAt': record.providedAt.toIso8601String(),
        'verification': verification.name,
        'otpRef': otpRef,
        'photoPath': photoPath,
        'providedByWorkerId': providedByWorkerId,
      },
    );

    return id;
  }

  Future<List<ThrTransaction>> forBeneficiary(int beneficiaryId) {
    return _isar.isar.thrTransactions
        .filter()
        .beneficiaryIdEqualTo(beneficiaryId)
        .sortByProvidedAtDesc()
        .findAll();
  }

  Future<List<ThrTransaction>> recent({int days = 30}) {
    final since = DateTime.now().subtract(Duration(days: days));
    return _isar.isar.thrTransactions
        .filter()
        .providedAtGreaterThan(since)
        .findAll();
  }
}

final thrRepoProvider = Provider<ThrRepo>((ref) {
  return ThrRepo(isarService, ref.read(syncRepoProvider));
});