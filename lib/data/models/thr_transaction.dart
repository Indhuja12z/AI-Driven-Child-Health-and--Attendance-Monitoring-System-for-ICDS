import 'package:isar_community/isar.dart';
import 'attendance.dart'; // for VerificationMethod

part 'thr_transaction.g.dart';

/// What kind of THR item was provided.
enum ThrItem {
  takeHomeRation,  // Standard THR packet
  hotCookedMeal,   // HCM (some AWWs log it here too)
  supplement,      // IFA / other supplements
}

@collection
class ThrTransaction {
  Id id = Isar.autoIncrement;

  @Index()
  late int beneficiaryId;

  @Enumerated(EnumType.ordinal)
  late ThrItem item;

  /// Quantity / description (e.g., "1 packet", "500g")
  String? quantityNote;

  late DateTime providedAt;

  /// Same verification hierarchy: QR → OTP → Manual
  @Enumerated(EnumType.ordinal)
  late VerificationMethod verification;

  String? otpRef;

  /// Optional photo proof (local path)
  String? photoPath;

  /// AWW who provided it
  String? providedByWorkerId;

  // ---------------- Sync ----------------
  bool isDirty = true;
  bool isSynced = false;
  DateTime? syncedAt;
   String? cloudId;
}