import 'package:isar_community/isar.dart';
import 'beneficiary.dart';

/// Alias so we can write `isar.beneficiaries` instead of `isar.beneficiarys`
extension BeneficiaryCollectionAlias on Isar {
  IsarCollection<Beneficiary> get beneficiaries => beneficiarys;
}