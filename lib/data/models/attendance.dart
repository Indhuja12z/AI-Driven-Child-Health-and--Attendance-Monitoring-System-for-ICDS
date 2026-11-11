import 'package:isar_community/isar.dart';

part 'attendance.g.dart';

/// How a beneficiary was verified during attendance / THR.
enum VerificationMethod {
  qr,       // QR scan (preferred)
  otp,      // OTP fallback (online)
  manual,   // Manual offline lookup
}

/// What kind of attendance this is.
enum AttendanceKind {
  pse,        // Pre-School Education
  hcm,        // Hot Cooked Meal
  snack,      // Morning Snacks
}

@collection
class Attendance {
  Id id = Isar.autoIncrement;

  @Index()
  late int beneficiaryId;

  @Enumerated(EnumType.ordinal)
  late AttendanceKind kind;

  late DateTime markedAt;   // Date + time of the record

  /// Which verification method was used (audit-logged!)
  @Enumerated(EnumType.ordinal)
  late VerificationMethod verification;

  /// If OTP was used, store the OTP reference (last 4 digits, hashed)
  String? otpRef;

  /// AWW who marked it
  String? markedByWorkerId;

  // ---------------- Sync ----------------
  bool isDirty = true;
  bool isSynced = false;
  DateTime? syncedAt;
  String? cloudId;
}