import 'package:isar_community/isar.dart';
import 'beneficiary.dart';

part 'growth_record.g.dart';

/// One growth measurement entry. Created monthly (or more often if needed).
@collection
class GrowthRecord {
  Id id = Isar.autoIncrement;

  /// Link to the beneficiary
  @Index()
  late int beneficiaryId;

  // ---------------- Raw measurements ----------------
  late double heightCm;      // Height in cm
  late double weightKg;      // Weight in kg
  double? muacCm;            // Mid-Upper Arm Circumference (6m–5y)

  late DateTime measuredAt;  // Date of measurement

  // ---------------- WHO Z-scores (computed on save) ----------------
  double? waz;   // Weight-for-Age Z-score
  double? haz;   // Height-for-Age Z-score
  double? whz;   // Weight-for-Height Z-score
  double? baz;   // BMI-for-Age Z-score

  // ---------------- Classification ----------------
  @Enumerated(EnumType.ordinal)
  NutritionalStatus status = NutritionalStatus.normal;

  /// Free-text note from AWW
  String? note;

  // ---------------- Meta ----------------
  late DateTime createdAt;
  bool isDirty = true;

  // ---------------- Cloud Sync ----------------
  DateTime? syncedAt;
  String? cloudId;
}