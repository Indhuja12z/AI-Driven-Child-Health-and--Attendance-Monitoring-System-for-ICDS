import 'package:isar_community/isar.dart';

part 'beneficiary.g.dart';

/// Unified beneficiary type — one collection for all categories.
enum BeneficiaryType {
  pregnant,     // Pregnant Women
  lactating,    // Lactating Mothers
  child0to6m,   // Children 0–6 months
  child6mTo3y,  // Children 6 months – 3 years
  child3to6y,   // Children 3–6 years
  adolescent,   // Adolescent Girls
}

enum Gender { male, female, other }

@collection
class Beneficiary {
  /// Isar auto-increment ID
  Id id = Isar.autoIncrement;

  /// Unique QR code payload (e.g., a UUID or hash). This is what gets scanned.
  @Index(unique: true, replace: false)
  late String qrCode;

  /// Type of beneficiary
  @Enumerated(EnumType.ordinal)
  late BeneficiaryType type;

  // ---------------- Basic Info ----------------
  late String name;
  @Enumerated(EnumType.ordinal)
  late Gender gender;
  DateTime? dateOfBirth;

  /// Local photo path (for offline visual verification)
  String? photoPath;

  // ---------------- Contact ----------------
  String? phoneNumber;
  String? address;
  String? guardianName;

  // ---------------- National IDs ----------------
  String? aadhaarNumber;
  String? abhaNumber;

  bool aadhaarVerified = false;
  bool faceVerified = false;

  // ---------------- Pregnancy / Lactation fields ----------------
  DateTime? lastMenstrualPeriod;
  DateTime? expectedDeliveryDate;
  DateTime? deliveryDate;

  // ---------------- Latest Growth Snapshot ----------------
  double? lastHeightCm;
  double? lastWeightKg;
  double? lastMuacCm;

  /// Last computed nutritional status
  @Enumerated(EnumType.ordinal)
  NutritionalStatus lastStatus = NutritionalStatus.normal;

  @Enumerated(EnumType.ordinal)
List<HealthIssue> healthIssues = [];

  // ---------------- Meta ----------------
  late DateTime createdAt;
  late DateTime updatedAt;

  bool isDirty = true;
  bool isDeleted = false;

   // ---------------- Cloud Sync ----------------
  DateTime? syncedAt;
  String? cloudId;
}
/// Health conditions that elevate malnutrition risk.
enum HealthIssue {
  none,
  anemia,
  congenitalHeartDisease,
  asthma,
  tuberculosis,
  chronicDiarrhea,
  hivExposure,
  disability,
  other,
}
/// Nutritional status classification (per WHO Anthro)
enum NutritionalStatus {
  normal,
  mam,
  sam,
  stunted,
  wasted,
  underweight,
  overweight,
}

/// Alias so we can use `isar.beneficiaries` (Isar generates `beneficiarys`).
extension BeneficiaryCollectionAlias on Isar {
  IsarCollection<Beneficiary> get beneficiaries => beneficiarys;
}