import 'dart:math';
import '../../data/models/beneficiary.dart';

class QrGenerator {
  static final _rand = Random.secure();
  static const _chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';

  /// Generate a unique QR payload for a beneficiary.
  /// Format: LST-<TYPE>-<RANDOM10>
  static String generate(BeneficiaryType type) {
    final typeTag = switch (type) {
      BeneficiaryType.pregnant    => 'PG',
      BeneficiaryType.lactating   => 'LM',
      BeneficiaryType.child0to6m  => 'C1',
      BeneficiaryType.child6mTo3y => 'C2',
      BeneficiaryType.child3to6y  => 'C3',
      BeneficiaryType.adolescent  => 'AG',
    };
    final random = List.generate(10, (_) => _chars[_rand.nextInt(_chars.length)])
        .join();
    return 'LST-$typeTag-$random';
  }
}