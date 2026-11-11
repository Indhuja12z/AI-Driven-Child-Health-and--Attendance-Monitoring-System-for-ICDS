import 'package:isar_community/isar.dart';

part 'sync_queue_item.g.dart';

enum SyncPriority { p1Critical, p2Important, p3Low }

/// Which backend endpoint this item targets.
enum SyncTarget {
  attendance,
  thr,
  growth,
  homeVisit,
  awcInfra,
  beneficiary,
}

/// What operation to perform.
enum SyncOperation {
  create,
  update,
  delete,
}

/// A single queued sync task.
/// When offline, every write creates one of these.
/// The sync engine processes them FIFO when network returns.
@collection
class SyncQueueItem {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.ordinal)
  late SyncTarget target;

  @Enumerated(EnumType.ordinal)
  late SyncOperation operation;

  /// Priority for sync ordering (P1 = flush first)
  @Enumerated(EnumType.ordinal)
  SyncPriority priority = SyncPriority.p3Low;

  /// The Isar ID of the affected record (in its own collection)
  late int localRecordId;

  /// JSON-serialized payload (serialize at enqueue time)
  late String payloadJson;

  /// How many times we've tried to sync this item
  int attempts = 0;

  /// Last error message (if any)
  String? lastError;

  late DateTime queuedAt;
  DateTime? lastAttemptAt;


}