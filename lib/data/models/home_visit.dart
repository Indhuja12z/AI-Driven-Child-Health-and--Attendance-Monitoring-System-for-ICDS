import 'package:isar_community/isar.dart';

part 'home_visit.g.dart';

/// Why the visit was scheduled.
enum VisitReason {
  newbornCare,        // Newborn care window
  pregnancyMilestone, // ANC / pregnancy milestone
  growthConcern,      // SAM / MAM follow-up
  routine,            // Routine check
}

enum VisitStatus {
  due,
  completed,
  missed,
}

enum VisitSeverity { high, moderate, low }

@collection
class HomeVisit {
  Id id = Isar.autoIncrement;

  @Index()
  late int beneficiaryId;

  @Enumerated(EnumType.ordinal)
  late VisitReason reason;

  @Enumerated(EnumType.ordinal)
  VisitStatus status = VisitStatus.due;

  late DateTime scheduledFor;    // Due date
  DateTime? completedAt;         // When actually visited
  
  @Enumerated(EnumType.ordinal)
VisitSeverity severity = VisitSeverity.low;
  /// AWW's counseling notes
  String? notes;

  /// Optional photo proof
  String? photoPath;

  // ---------------- Sync ----------------
  bool isDirty = true;
  bool isSynced = false;
  DateTime? syncedAt;   // ← add
  String? cloudId; 
}