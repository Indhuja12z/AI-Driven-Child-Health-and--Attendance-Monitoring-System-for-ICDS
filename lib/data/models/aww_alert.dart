import 'package:isar_community/isar.dart';

part 'aww_alert.g.dart';

enum AlertAction { scheduleHomeVisit, notifyClinic, none }

@collection
class AwwAlert {
  Id id = Isar.autoIncrement;

  late String title;
  late String message;

  @Enumerated(EnumType.ordinal)
  AlertAction action = AlertAction.none;

  int? beneficiaryId;
  int? referralId;

  bool isResolved = false;
  late DateTime createdAt;
  DateTime? expiresAt;

  // ---------------- Sync ----------------
  bool isDirty = true;
  bool isSynced = false;
  DateTime? syncedAt;
  String? cloudId;
}