import 'package:isar_community/isar.dart';

part 'clinic_referral.g.dart';

enum ReferralStatus { pendingApproval, sent, dismissed }

@collection
class ClinicReferral {
  Id id = Isar.autoIncrement;

  @Index()
  late int beneficiaryId;

  late String clinicName;
  late String clinicPhone;
  late String reason;

  @Enumerated(EnumType.ordinal)
  ReferralStatus status = ReferralStatus.pendingApproval;

  late DateTime createdAt;
  DateTime? sentAt;
  String? awwDecisionBy;
  DateTime? decisionAt;

  // ---------------- Sync ----------------
  bool isDirty = true;
  bool isSynced = false;
  DateTime? syncedAt;
  String? cloudId;
}