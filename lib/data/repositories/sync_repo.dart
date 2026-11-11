import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import '../local/isar_service.dart';
import '../models/sync_queue_item.dart';

class SyncRepo {
  final IsarService _isar;
  SyncRepo(this._isar);

  /// Enqueue a record for later upload.
  Future<int> enqueue({
    required SyncTarget target,
    required SyncOperation op,
    required int localRecordId,
    required Map<String, dynamic> payload,
    SyncPriority priority = SyncPriority.p3Low,
  }) {
    final item = SyncQueueItem()
      ..target = target
      ..operation = op
      ..priority = priority
      ..localRecordId = localRecordId
      ..payloadJson = jsonEncode(payload)
      ..queuedAt = DateTime.now();

    return _isar.isar.writeTxn(() => _isar.isar.syncQueueItems.put(item));
  }

  /// Pending items sorted by priority (P1 first), then FIFO.
  Future<List<SyncQueueItem>> pending() {
    return _isar.isar.syncQueueItems
        .where()
        .sortByPriority()
        .thenByQueuedAt()
        .findAll();
  }

  /// Count of pending items (for UI badge).
  Future<int> pendingCount() {
    return _isar.isar.syncQueueItems.count();
  }

  Future<void> markAttempt(int id, {String? error}) async {
    await _isar.isar.writeTxn(() async {
      final item = await _isar.isar.syncQueueItems.get(id);
      if (item == null) return;
      item.attempts += 1;
      item.lastAttemptAt = DateTime.now();
      item.lastError = error;
      await _isar.isar.syncQueueItems.put(item);
    });
  }

  Future<void> remove(int id) async {
    await _isar.isar.writeTxn(() => _isar.isar.syncQueueItems.delete(id));
  }

  Future<void> clearAll() async {
    await _isar.isar.writeTxn(() => _isar.isar.syncQueueItems.clear());
  }
}

final syncRepoProvider = Provider<SyncRepo>((ref) {
  return SyncRepo(isarService);
});