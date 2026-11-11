import 'package:isar_community/isar.dart';

part 'awc_infra.g.dart';

/// Infrastructure audit record for the Anganwadi Centre.
/// One record per audit (kept as history).
@collection
class AwcInfra {
  Id id = Isar.autoIncrement;

  // ---------------- Checklist (simple booleans) ----------------
  bool hasToilet = false;
  bool hasDrinkingWater = false;
  bool hasElectricity = false;
  bool isBuildingSafe = false;
  bool hasHygieneSupplies = false;

  // ---------------- Optional notes ----------------
  String? notes;

  // ---------------- Geotag ----------------
  double? latitude;
  double? longitude;
  String? photoPath;

  late DateTime auditedAt;

  // ---------------- Sync ----------------
  bool isDirty = true;
  bool isSynced = false;
}