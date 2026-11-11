import 'package:isar_community/isar.dart';
import '../local/isar_service.dart';
import '../models/beneficiary.dart';
import '../models/growth_record.dart';

class DemoSeeder {
  final IsarService _isar;
  DemoSeeder(this._isar);

  Future<void> seedIfEmpty() async {
    await _repairMissingDobs();

    final count = await _isar.isar.beneficiaries.count();
    if (count > 0) return;

    final samples = <Beneficiary>[];

    // ---- 10 × Children 0–6 months ----
    final babyNames = [
      'Aarav Kumar', 'Diya Sharma', 'Vihaan Reddy', 'Anaya Patel',
      'Aditya Rao', 'Saanvi Nair', 'Ishaan Menon', 'Kiara Joshi',
      'Rudra Iyer', 'Aadhya Pillai',
    ];
    for (int i = 0; i < 10; i++) {
      samples.add(_make(
        name: babyNames[i],
        type: BeneficiaryType.child0to6m,
        gender: i.isEven ? Gender.male : Gender.female,
        months: 1 + (i % 5),
      ));
    }

    // ---- 10 × Children 6m–3y ----
    final toddlerNames = [
      'Kiaan Verma', 'Myra Gupta', 'Arjun Das', 'Aarohi Bose',
      'Vivaan Chatterjee', 'Riya Sen', 'Kabir Malhotra', 'Anvi Kapoor',
      'Aryan Bhatt', 'Sara Khan',
    ];
    for (int i = 0; i < 10; i++) {
      samples.add(_make(
        name: toddlerNames[i],
        type: BeneficiaryType.child6mTo3y,
        gender: i.isEven ? Gender.male : Gender.female,
        months: 8 + (i * 2),
      ));
    }

    // ---- 10 × Children 3–6 years ----
    final kidNames = [
      'Reyansh Nair', 'Ishita Menon', 'Kavya Krishnan', 'Advik Sharma',
      'Tanvi Reddy', 'Dhruv Patel', 'Aaradhya Rao', 'Shaurya Kumar',
      'Pari Singh', 'Neel Joshi',
    ];
    for (int i = 0; i < 10; i++) {
      samples.add(_make(
        name: kidNames[i],
        type: BeneficiaryType.child3to6y,
        gender: i.isEven ? Gender.male : Gender.female,
        months: 38 + (i * 3),
      ));
    }

    // ---- 10 × Pregnant Women ----
    final pregnantNames = [
      'Lakshmi Iyer', 'Meena Rajan', 'Sarita Devi', 'Radha Kumari',
      'Anjali Nair', 'Kavitha Reddy', 'Pooja Sharma', 'Sunita Patel',
      'Gita Menon', 'Deepa Krishnan',
    ];
    for (int i = 0; i < 10; i++) {
      samples.add(_make(
        name: pregnantNames[i],
        type: BeneficiaryType.pregnant,
        gender: Gender.female,
        months: 0,
        pregnancyMonths: 2 + (i % 7),
      ));
    }

    // ---- 10 × Lactating Mothers ----
    final lactatingNames = [
      'Sundari Devi', 'Rekha Nair', 'Shanti Kumari', 'Lalitha Rao',
      'Vasanthi Iyer', 'Mala Menon', 'Nirmala Patel', 'Kala Sharma',
      'Rani Devi', 'Padma Reddy',
    ];
    for (int i = 0; i < 10; i++) {
      samples.add(_make(
        name: lactatingNames[i],
        type: BeneficiaryType.lactating,
        gender: Gender.female,
        months: 0,
        deliveryMonthsAgo: 1 + (i % 6),
      ));
    }

    // ✅ Transaction 1: Save all beneficiaries
    await _isar.isar.writeTxn(() async {
      await _isar.isar.beneficiaries.putAll(samples);
    });

    // ✅ Transaction 2 (SEPARATE): Save mock growth records
    // Must be OUTSIDE the above transaction to avoid nested transaction error.
    await _seedMockGrowthForOlderKids();
  }

  /// Adds mock BMI history for 5–6 year olds to demonstrate the trend logic.
  Future<void> _seedMockGrowthForOlderKids() async {
    final olderKids = await _isar.isar.beneficiaries
        .filter()
        .typeEqualTo(BeneficiaryType.child3to6y)
        .findAll();

    // Only 60–72 months (5–6y)
    final fiveToSixYearOlds = olderKids.where((b) {
      if (b.dateOfBirth == null) return false;
      final m = (DateTime.now().year - b.dateOfBirth!.year) * 12 +
          (DateTime.now().month - b.dateOfBirth!.month);
      return m >= 60 && m <= 72;
    }).toList();

    if (fiveToSixYearOlds.isEmpty) return;

    final records = <GrowthRecord>[];
    final now = DateTime.now();

    for (final child in fiveToSixYearOlds) {
      // 3 mock BMI history entries over 3 months
      final h = 105.0 + (child.id % 10); // 105–115 cm
      final bmiSequence = [
        15.0, // M1 — normal
        14.0, // M2 — moderate malnutrition (13–14 range)
        13.0, // M3 — moderate/sam boundary
      ];

      for (int i = 0; i < bmiSequence.length; i++) {
        final heightM = h / 100.0;
        final weight = bmiSequence[i] * heightM * heightM;
        final measuredAt = now.subtract(Duration(days: (3 - i) * 30));

        records.add(GrowthRecord()
          ..beneficiaryId = child.id
          ..heightCm = h
          ..weightKg = weight
          ..measuredAt = measuredAt
          ..status = NutritionalStatus.normal // placeholder
          ..createdAt = measuredAt);
      }
    }

    // ✅ Its own transaction
    await _isar.isar.writeTxn(() async {
      await _isar.isar.growthRecords.putAll(records);
    });
  }

  /// Patch any child beneficiary that's missing a dateOfBirth.
  Future<void> _repairMissingDobs() async {
    final all = await _isar.isar.beneficiaries.where().findAll();
    final now = DateTime.now();
    bool changed = false;

    for (final b in all) {
      final isChild = b.type == BeneficiaryType.child0to6m ||
          b.type == BeneficiaryType.child6mTo3y ||
          b.type == BeneficiaryType.child3to6y;
      if (!isChild) continue;
      if (b.dateOfBirth != null) continue;

      final months = switch (b.type) {
        BeneficiaryType.child0to6m => 3,
        BeneficiaryType.child6mTo3y => 18,
        BeneficiaryType.child3to6y => 48,
        _ => 24,
      };
      b.dateOfBirth = DateTime(now.year, now.month - months, now.day);
      b.updatedAt = now;
      b.isDirty = true;
      changed = true;
    }

    if (changed) {
      await _isar.isar.writeTxn(() async {
        await _isar.isar.beneficiaries.putAll(all);
      });
    }
  }

  Beneficiary _make({
    required String name,
    required BeneficiaryType type,
    required Gender gender,
    required int months,
    int? pregnancyMonths,
    int? deliveryMonthsAgo,
  }) {
    final now = DateTime.now();
    final b = Beneficiary()
      ..qrCode = 'LST-${type.name.toUpperCase()}-${now.microsecondsSinceEpoch}-${name.hashCode.abs()}'
      ..name = name
      ..type = type
      ..gender = gender
      ..createdAt = now
      ..updatedAt = now
      ..isDirty = false;

    if (months > 0) {
      b.dateOfBirth = DateTime(now.year, now.month - months, now.day);
    }
    if (pregnancyMonths != null) {
      b.lastMenstrualPeriod =
          now.subtract(Duration(days: pregnancyMonths * 30));
      b.expectedDeliveryDate =
          b.lastMenstrualPeriod!.add(const Duration(days: 280));
    }
    if (deliveryMonthsAgo != null) {
      b.deliveryDate = now.subtract(Duration(days: deliveryMonthsAgo * 30));
    }
    return b;
  }
}