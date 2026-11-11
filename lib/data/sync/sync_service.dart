import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';       // ← for Firebase.app()
import 'package:flutter/foundation.dart';
import '../local/isar_service.dart';
import '../models/attendance.dart';
import '../models/beneficiary.dart';
import '../models/growth_record.dart';
import '../models/home_visit.dart';
import '../models/sync_queue_item.dart';
import '../models/thr_transaction.dart';
import '../repositories/sync_repo.dart';

class SyncService {
  final IsarService _isar;
  final SyncRepo _syncRepo;
  final FirebaseFirestore _firestore;

  bool _isSyncing = false;

  SyncService({
    required IsarService isar,
    required SyncRepo syncRepo,
    FirebaseFirestore? firestore,
  })  : _isar = isar,
        _syncRepo = syncRepo,
        _firestore = firestore ?? FirebaseFirestore.instance;

  /// Returns true if sync succeeded (or nothing to sync).
  Future<bool> pushPendingItems() async {
    if (_isSyncing) {
      debugPrint('SYNC: already in progress, skipping');
      return false;
    }
    _isSyncing = true;

    try {
      final pending = await _syncRepo.pending();
      if (pending.isEmpty) {
        debugPrint('SYNC: nothing to push');
        return true;
      }

      debugPrint('SYNC: ${pending.length} items to push');

      // Firestore max 500 ops per batch — use 400 to be safe
      final chunks = _chunk(pending, 400);

      for (final chunk in chunks) {
        final ok = await _pushChunk(chunk);
        if (!ok) {
          debugPrint('SYNC: chunk failed, aborting');
          return false;
        }
      }

      debugPrint('SYNC: all items pushed successfully');
      return true;
    } catch (e) {
      debugPrint('SYNC: unexpected error — $e');
      return false;
    } finally {
      _isSyncing = false;
    }
  }

  // ---------------- Internals ----------------

  Future<bool> _pushChunk(List<SyncQueueItem> items) async {
    final batch = _firestore.batch();
    final succeeded = <SyncQueueItem>[];
    final succeededIds = <int>[];

    for (final item in items) {
      try {
        final payload = jsonDecode(item.payloadJson) as Map<String, dynamic>;

        // Determine target collection + doc id
        final collection = _collectionFor(item.target);
        if (collection == null) {
          // Unknown target — drop it silently
          await _syncRepo.remove(item.id);
          continue;
        }

        final docId = '${item.localRecordId}';
        final docRef = _firestore.collection(collection).doc(docId);

        // Add server timestamp + local id
        payload['localId'] = item.localRecordId;
        payload['syncedAt'] = FieldValue.serverTimestamp();

        switch (item.operation) {
          case SyncOperation.create:
          case SyncOperation.update:
            batch.set(docRef, payload, SetOptions(merge: true));
            break;
          case SyncOperation.delete:
            batch.delete(docRef);
            break;
        }

        succeeded.add(item);
        succeededIds.add(item.localRecordId);
      } catch (e) {
        debugPrint('SYNC: prepare failed for item ${item.id} — $e');
        await _syncRepo.markAttempt(item.id, error: e.toString());
      }
    }

    if (succeeded.isEmpty) {
      return true; // nothing to commit
    }

    try {
     debugPrint(
  'FIRESTORE_DIAG: project=${Firebase.app().options.projectId}',
);
      await batch.commit();
      debugPrint('SYNC: batch of ${succeeded.length} committed');

      // Remove from queue
      for (final item in succeeded) {
        await _syncRepo.remove(item.id);
      }

      // Mark local records as synced
      await _markLocalSynced(items, succeededIds);

      return true;
    } catch (e) {
      debugPrint('SYNC: batch commit failed — $e');
      for (final item in succeeded) {
        await _syncRepo.markAttempt(item.id, error: e.toString());
      }
      return false;
    }
  }

  Future<void> _markLocalSynced(
    List<SyncQueueItem> allItems,
    List<int> ids,
  ) async {
    final now = DateTime.now();

    await _isar.isar.writeTxn(() async {
      for (final item in allItems) {
        if (!ids.contains(item.localRecordId)) continue;

        switch (item.target) {
          case SyncTarget.beneficiary:
            final b = await _isar.isar.beneficiaries.get(item.localRecordId);
            if (b != null) {
              b.syncedAt = now;
              b.cloudId = '${item.localRecordId}';
              b.isDirty = false;
              await _isar.isar.beneficiaries.put(b);
            }
            break;
          case SyncTarget.growth:
            final g = await _isar.isar.growthRecords.get(item.localRecordId);
            if (g != null) {
              g.syncedAt = now;
              g.cloudId = '${item.localRecordId}';
              g.isDirty = false;
              await _isar.isar.growthRecords.put(g);
            }
            break;
          case SyncTarget.attendance:
            final a = await _isar.isar.attendances.get(item.localRecordId);
            if (a != null) {
              a.syncedAt = now;
              a.cloudId = '${item.localRecordId}';
              a.isDirty = false;
              a.isSynced = true;
              await _isar.isar.attendances.put(a);
            }
            break;
          case SyncTarget.thr:
            final t = await _isar.isar.thrTransactions.get(item.localRecordId);
            if (t != null) {
              t.syncedAt = now;
              t.cloudId = '${item.localRecordId}';
              t.isDirty = false;
              t.isSynced = true;
              await _isar.isar.thrTransactions.put(t);
            }
            break;
          case SyncTarget.homeVisit:
            final h = await _isar.isar.homeVisits.get(item.localRecordId);
            if (h != null) {
              h.syncedAt = now;
              h.cloudId = '${item.localRecordId}';
              h.isDirty = false;
              h.isSynced = true;
              await _isar.isar.homeVisits.put(h);
            }
            break;
          case SyncTarget.awcInfra:
            // Optional — skip for now
            break;
        }
      }
    });
  }

  /// Map SyncTarget → Firestore collection name
  String? _collectionFor(SyncTarget t) {
    switch (t) {
      case SyncTarget.beneficiary:
        return 'beneficiaries';
      case SyncTarget.growth:
        return 'growth_records';
      case SyncTarget.attendance:
        return 'attendance_logs';
      case SyncTarget.thr:
        return 'thr_transactions';
      case SyncTarget.homeVisit:
        return 'home_visits';
      case SyncTarget.awcInfra:
        return 'awc_infra';
    }
  }

  List<List<T>> _chunk<T>(List<T> list, int size) {
    final chunks = <List<T>>[];
    for (int i = 0; i < list.length; i += size) {
      chunks.add(list.sublist(
        i,
        (i + size).clamp(0, list.length),
      ));
    }
    return chunks;
  }
}