// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBeneficiaryCollection on Isar {
  IsarCollection<Beneficiary> get beneficiarys => this.collection();
}

const BeneficiarySchema = CollectionSchema(
  name: r'Beneficiary',
  id: -7106369371336791482,
  properties: {
    r'aadhaarNumber': PropertySchema(
      id: 0,
      name: r'aadhaarNumber',
      type: IsarType.string,
    ),
    r'aadhaarVerified': PropertySchema(
      id: 1,
      name: r'aadhaarVerified',
      type: IsarType.bool,
    ),
    r'abhaNumber': PropertySchema(
      id: 2,
      name: r'abhaNumber',
      type: IsarType.string,
    ),
    r'address': PropertySchema(id: 3, name: r'address', type: IsarType.string),
    r'cloudId': PropertySchema(id: 4, name: r'cloudId', type: IsarType.string),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dateOfBirth': PropertySchema(
      id: 6,
      name: r'dateOfBirth',
      type: IsarType.dateTime,
    ),
    r'deliveryDate': PropertySchema(
      id: 7,
      name: r'deliveryDate',
      type: IsarType.dateTime,
    ),
    r'expectedDeliveryDate': PropertySchema(
      id: 8,
      name: r'expectedDeliveryDate',
      type: IsarType.dateTime,
    ),
    r'faceVerified': PropertySchema(
      id: 9,
      name: r'faceVerified',
      type: IsarType.bool,
    ),
    r'gender': PropertySchema(
      id: 10,
      name: r'gender',
      type: IsarType.byte,
      enumMap: _BeneficiarygenderEnumValueMap,
    ),
    r'guardianName': PropertySchema(
      id: 11,
      name: r'guardianName',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 12,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'isDirty': PropertySchema(id: 13, name: r'isDirty', type: IsarType.bool),
    r'lastHeightCm': PropertySchema(
      id: 14,
      name: r'lastHeightCm',
      type: IsarType.double,
    ),
    r'lastMenstrualPeriod': PropertySchema(
      id: 15,
      name: r'lastMenstrualPeriod',
      type: IsarType.dateTime,
    ),
    r'lastMuacCm': PropertySchema(
      id: 16,
      name: r'lastMuacCm',
      type: IsarType.double,
    ),
    r'lastStatus': PropertySchema(
      id: 17,
      name: r'lastStatus',
      type: IsarType.byte,
      enumMap: _BeneficiarylastStatusEnumValueMap,
    ),
    r'lastWeightKg': PropertySchema(
      id: 18,
      name: r'lastWeightKg',
      type: IsarType.double,
    ),
    r'name': PropertySchema(id: 19, name: r'name', type: IsarType.string),
    r'phoneNumber': PropertySchema(
      id: 20,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'photoPath': PropertySchema(
      id: 21,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'qrCode': PropertySchema(id: 22, name: r'qrCode', type: IsarType.string),
    r'syncedAt': PropertySchema(
      id: 23,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 24,
      name: r'type',
      type: IsarType.byte,
      enumMap: _BeneficiarytypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 25,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _beneficiaryEstimateSize,
  serialize: _beneficiarySerialize,
  deserialize: _beneficiaryDeserialize,
  deserializeProp: _beneficiaryDeserializeProp,
  idName: r'id',
  indexes: {
    r'qrCode': IndexSchema(
      id: 4920222878361108799,
      name: r'qrCode',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'qrCode',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _beneficiaryGetId,
  getLinks: _beneficiaryGetLinks,
  attach: _beneficiaryAttach,
  version: '3.3.2',
);

int _beneficiaryEstimateSize(
  Beneficiary object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aadhaarNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.abhaNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cloudId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.guardianName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.phoneNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.qrCode.length * 3;
  return bytesCount;
}

void _beneficiarySerialize(
  Beneficiary object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aadhaarNumber);
  writer.writeBool(offsets[1], object.aadhaarVerified);
  writer.writeString(offsets[2], object.abhaNumber);
  writer.writeString(offsets[3], object.address);
  writer.writeString(offsets[4], object.cloudId);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeDateTime(offsets[6], object.dateOfBirth);
  writer.writeDateTime(offsets[7], object.deliveryDate);
  writer.writeDateTime(offsets[8], object.expectedDeliveryDate);
  writer.writeBool(offsets[9], object.faceVerified);
  writer.writeByte(offsets[10], object.gender.index);
  writer.writeString(offsets[11], object.guardianName);
  writer.writeBool(offsets[12], object.isDeleted);
  writer.writeBool(offsets[13], object.isDirty);
  writer.writeDouble(offsets[14], object.lastHeightCm);
  writer.writeDateTime(offsets[15], object.lastMenstrualPeriod);
  writer.writeDouble(offsets[16], object.lastMuacCm);
  writer.writeByte(offsets[17], object.lastStatus.index);
  writer.writeDouble(offsets[18], object.lastWeightKg);
  writer.writeString(offsets[19], object.name);
  writer.writeString(offsets[20], object.phoneNumber);
  writer.writeString(offsets[21], object.photoPath);
  writer.writeString(offsets[22], object.qrCode);
  writer.writeDateTime(offsets[23], object.syncedAt);
  writer.writeByte(offsets[24], object.type.index);
  writer.writeDateTime(offsets[25], object.updatedAt);
}

Beneficiary _beneficiaryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Beneficiary();
  object.aadhaarNumber = reader.readStringOrNull(offsets[0]);
  object.aadhaarVerified = reader.readBool(offsets[1]);
  object.abhaNumber = reader.readStringOrNull(offsets[2]);
  object.address = reader.readStringOrNull(offsets[3]);
  object.cloudId = reader.readStringOrNull(offsets[4]);
  object.createdAt = reader.readDateTime(offsets[5]);
  object.dateOfBirth = reader.readDateTimeOrNull(offsets[6]);
  object.deliveryDate = reader.readDateTimeOrNull(offsets[7]);
  object.expectedDeliveryDate = reader.readDateTimeOrNull(offsets[8]);
  object.faceVerified = reader.readBool(offsets[9]);
  object.gender =
      _BeneficiarygenderValueEnumMap[reader.readByteOrNull(offsets[10])] ??
      Gender.male;
  object.guardianName = reader.readStringOrNull(offsets[11]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[12]);
  object.isDirty = reader.readBool(offsets[13]);
  object.lastHeightCm = reader.readDoubleOrNull(offsets[14]);
  object.lastMenstrualPeriod = reader.readDateTimeOrNull(offsets[15]);
  object.lastMuacCm = reader.readDoubleOrNull(offsets[16]);
  object.lastStatus =
      _BeneficiarylastStatusValueEnumMap[reader.readByteOrNull(offsets[17])] ??
      NutritionalStatus.normal;
  object.lastWeightKg = reader.readDoubleOrNull(offsets[18]);
  object.name = reader.readString(offsets[19]);
  object.phoneNumber = reader.readStringOrNull(offsets[20]);
  object.photoPath = reader.readStringOrNull(offsets[21]);
  object.qrCode = reader.readString(offsets[22]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[23]);
  object.type =
      _BeneficiarytypeValueEnumMap[reader.readByteOrNull(offsets[24])] ??
      BeneficiaryType.pregnant;
  object.updatedAt = reader.readDateTime(offsets[25]);
  return object;
}

P _beneficiaryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (_BeneficiarygenderValueEnumMap[reader.readByteOrNull(offset)] ??
              Gender.male)
          as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (_BeneficiarylastStatusValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              NutritionalStatus.normal)
          as P;
    case 18:
      return (reader.readDoubleOrNull(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 24:
      return (_BeneficiarytypeValueEnumMap[reader.readByteOrNull(offset)] ??
              BeneficiaryType.pregnant)
          as P;
    case 25:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BeneficiarygenderEnumValueMap = {'male': 0, 'female': 1, 'other': 2};
const _BeneficiarygenderValueEnumMap = {
  0: Gender.male,
  1: Gender.female,
  2: Gender.other,
};
const _BeneficiarylastStatusEnumValueMap = {
  'normal': 0,
  'mam': 1,
  'sam': 2,
  'stunted': 3,
  'wasted': 4,
  'underweight': 5,
  'overweight': 6,
};
const _BeneficiarylastStatusValueEnumMap = {
  0: NutritionalStatus.normal,
  1: NutritionalStatus.mam,
  2: NutritionalStatus.sam,
  3: NutritionalStatus.stunted,
  4: NutritionalStatus.wasted,
  5: NutritionalStatus.underweight,
  6: NutritionalStatus.overweight,
};
const _BeneficiarytypeEnumValueMap = {
  'pregnant': 0,
  'lactating': 1,
  'child0to6m': 2,
  'child6mTo3y': 3,
  'child3to6y': 4,
  'adolescent': 5,
};
const _BeneficiarytypeValueEnumMap = {
  0: BeneficiaryType.pregnant,
  1: BeneficiaryType.lactating,
  2: BeneficiaryType.child0to6m,
  3: BeneficiaryType.child6mTo3y,
  4: BeneficiaryType.child3to6y,
  5: BeneficiaryType.adolescent,
};

Id _beneficiaryGetId(Beneficiary object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _beneficiaryGetLinks(Beneficiary object) {
  return [];
}

void _beneficiaryAttach(
  IsarCollection<dynamic> col,
  Id id,
  Beneficiary object,
) {
  object.id = id;
}

extension BeneficiaryByIndex on IsarCollection<Beneficiary> {
  Future<Beneficiary?> getByQrCode(String qrCode) {
    return getByIndex(r'qrCode', [qrCode]);
  }

  Beneficiary? getByQrCodeSync(String qrCode) {
    return getByIndexSync(r'qrCode', [qrCode]);
  }

  Future<bool> deleteByQrCode(String qrCode) {
    return deleteByIndex(r'qrCode', [qrCode]);
  }

  bool deleteByQrCodeSync(String qrCode) {
    return deleteByIndexSync(r'qrCode', [qrCode]);
  }

  Future<List<Beneficiary?>> getAllByQrCode(List<String> qrCodeValues) {
    final values = qrCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'qrCode', values);
  }

  List<Beneficiary?> getAllByQrCodeSync(List<String> qrCodeValues) {
    final values = qrCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'qrCode', values);
  }

  Future<int> deleteAllByQrCode(List<String> qrCodeValues) {
    final values = qrCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'qrCode', values);
  }

  int deleteAllByQrCodeSync(List<String> qrCodeValues) {
    final values = qrCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'qrCode', values);
  }

  Future<Id> putByQrCode(Beneficiary object) {
    return putByIndex(r'qrCode', object);
  }

  Id putByQrCodeSync(Beneficiary object, {bool saveLinks = true}) {
    return putByIndexSync(r'qrCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByQrCode(List<Beneficiary> objects) {
    return putAllByIndex(r'qrCode', objects);
  }

  List<Id> putAllByQrCodeSync(
    List<Beneficiary> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'qrCode', objects, saveLinks: saveLinks);
  }
}

extension BeneficiaryQueryWhereSort
    on QueryBuilder<Beneficiary, Beneficiary, QWhere> {
  QueryBuilder<Beneficiary, Beneficiary, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BeneficiaryQueryWhere
    on QueryBuilder<Beneficiary, Beneficiary, QWhereClause> {
  QueryBuilder<Beneficiary, Beneficiary, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterWhereClause> qrCodeEqualTo(
    String qrCode,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'qrCode', value: [qrCode]),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterWhereClause> qrCodeNotEqualTo(
    String qrCode,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'qrCode',
                lower: [],
                upper: [qrCode],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'qrCode',
                lower: [qrCode],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'qrCode',
                lower: [qrCode],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'qrCode',
                lower: [],
                upper: [qrCode],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension BeneficiaryQueryFilter
    on QueryBuilder<Beneficiary, Beneficiary, QFilterCondition> {
  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'aadhaarNumber'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'aadhaarNumber'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'aadhaarNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'aadhaarNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'aadhaarNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'aadhaarNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'aadhaarNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'aadhaarNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'aadhaarNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'aadhaarNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aadhaarNumber', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'aadhaarNumber', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  aadhaarVerifiedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aadhaarVerified', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'abhaNumber'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'abhaNumber'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'abhaNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'abhaNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'abhaNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'abhaNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'abhaNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'abhaNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'abhaNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'abhaNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'abhaNumber', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  abhaNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'abhaNumber', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'address'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'address'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'address',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  addressStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> addressContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> addressMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'address',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'address', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'address', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  cloudIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  cloudIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> cloudIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cloudId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  cloudIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cloudId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> cloudIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cloudId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> cloudIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cloudId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  cloudIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'cloudId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> cloudIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'cloudId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> cloudIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'cloudId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> cloudIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'cloudId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  cloudIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  cloudIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  dateOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dateOfBirth'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  dateOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dateOfBirth'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  dateOfBirthEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dateOfBirth', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  dateOfBirthGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dateOfBirth',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  dateOfBirthLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dateOfBirth',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  dateOfBirthBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dateOfBirth',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  deliveryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'deliveryDate'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  deliveryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'deliveryDate'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  deliveryDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deliveryDate', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  deliveryDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deliveryDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  deliveryDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deliveryDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  deliveryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deliveryDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  expectedDeliveryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'expectedDeliveryDate'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  expectedDeliveryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'expectedDeliveryDate'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  expectedDeliveryDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'expectedDeliveryDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  expectedDeliveryDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'expectedDeliveryDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  expectedDeliveryDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'expectedDeliveryDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  expectedDeliveryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'expectedDeliveryDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  faceVerifiedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'faceVerified', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> genderEqualTo(
    Gender value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'gender', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  genderGreaterThan(Gender value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'gender',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> genderLessThan(
    Gender value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'gender',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> genderBetween(
    Gender lower,
    Gender upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'gender',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'guardianName'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'guardianName'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'guardianName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'guardianName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'guardianName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'guardianName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'guardianName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'guardianName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'guardianName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'guardianName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'guardianName', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  guardianNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'guardianName', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDeleted', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> isDirtyEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDirty', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastHeightCmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastHeightCm'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastHeightCmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastHeightCm'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastHeightCmEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastHeightCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastHeightCmGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastHeightCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastHeightCmLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastHeightCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastHeightCmBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastHeightCm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMenstrualPeriodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastMenstrualPeriod'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMenstrualPeriodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastMenstrualPeriod'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMenstrualPeriodEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastMenstrualPeriod', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMenstrualPeriodGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastMenstrualPeriod',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMenstrualPeriodLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastMenstrualPeriod',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMenstrualPeriodBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastMenstrualPeriod',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMuacCmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastMuacCm'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMuacCmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastMuacCm'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMuacCmEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastMuacCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMuacCmGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastMuacCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMuacCmLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastMuacCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastMuacCmBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastMuacCm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastStatusEqualTo(NutritionalStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastStatus', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastStatusGreaterThan(NutritionalStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastStatusLessThan(NutritionalStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastStatusBetween(
    NutritionalStatus lower,
    NutritionalStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastWeightKgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastWeightKg'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastWeightKgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastWeightKg'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastWeightKgEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastWeightKg',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastWeightKgGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastWeightKg',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastWeightKgLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastWeightKg',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  lastWeightKgBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastWeightKg',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'phoneNumber'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'phoneNumber'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phoneNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'phoneNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phoneNumber', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'phoneNumber', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photoPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'photoPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> qrCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  qrCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> qrCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> qrCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'qrCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  qrCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> qrCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> qrCodeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> qrCodeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'qrCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  qrCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'qrCode', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  qrCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'qrCode', value: ''),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> syncedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  syncedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  syncedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> syncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> typeEqualTo(
    BeneficiaryType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> typeGreaterThan(
    BeneficiaryType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> typeLessThan(
    BeneficiaryType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition> typeBetween(
    BeneficiaryType lower,
    BeneficiaryType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension BeneficiaryQueryObject
    on QueryBuilder<Beneficiary, Beneficiary, QFilterCondition> {}

extension BeneficiaryQueryLinks
    on QueryBuilder<Beneficiary, Beneficiary, QFilterCondition> {}

extension BeneficiaryQuerySortBy
    on QueryBuilder<Beneficiary, Beneficiary, QSortBy> {
  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByAadhaarNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarNumber', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByAadhaarNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarNumber', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByAadhaarVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarVerified', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByAadhaarVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarVerified', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByAbhaNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abhaNumber', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByAbhaNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abhaNumber', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryDate', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByDeliveryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryDate', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByExpectedDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedDeliveryDate', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByExpectedDeliveryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedDeliveryDate', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByFaceVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faceVerified', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByFaceVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faceVerified', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByGuardianName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianName', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByGuardianNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianName', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByLastHeightCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastHeightCm', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByLastHeightCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastHeightCm', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByLastMenstrualPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMenstrualPeriod', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByLastMenstrualPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMenstrualPeriod', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByLastMuacCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMuacCm', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByLastMuacCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMuacCm', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByLastStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastStatus', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByLastStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastStatus', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByLastWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWeightKg', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  sortByLastWeightKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWeightKg', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCode', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByQrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCode', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BeneficiaryQuerySortThenBy
    on QueryBuilder<Beneficiary, Beneficiary, QSortThenBy> {
  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByAadhaarNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarNumber', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByAadhaarNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarNumber', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByAadhaarVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarVerified', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByAadhaarVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarVerified', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByAbhaNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abhaNumber', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByAbhaNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abhaNumber', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryDate', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByDeliveryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryDate', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByExpectedDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedDeliveryDate', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByExpectedDeliveryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedDeliveryDate', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByFaceVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faceVerified', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByFaceVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faceVerified', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByGuardianName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianName', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByGuardianNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianName', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByLastHeightCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastHeightCm', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByLastHeightCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastHeightCm', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByLastMenstrualPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMenstrualPeriod', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByLastMenstrualPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMenstrualPeriod', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByLastMuacCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMuacCm', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByLastMuacCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMuacCm', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByLastStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastStatus', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByLastStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastStatus', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByLastWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWeightKg', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy>
  thenByLastWeightKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWeightKg', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCode', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByQrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCode', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BeneficiaryQueryWhereDistinct
    on QueryBuilder<Beneficiary, Beneficiary, QDistinct> {
  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByAadhaarNumber({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'aadhaarNumber',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct>
  distinctByAadhaarVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aadhaarVerified');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByAbhaNumber({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abhaNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByAddress({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByCloudId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateOfBirth');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryDate');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct>
  distinctByExpectedDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedDeliveryDate');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByFaceVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'faceVerified');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByGuardianName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'guardianName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDirty');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByLastHeightCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastHeightCm');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct>
  distinctByLastMenstrualPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastMenstrualPeriod');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByLastMuacCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastMuacCm');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByLastStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastStatus');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByLastWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWeightKg');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByPhoneNumber({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByPhotoPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByQrCode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qrCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<Beneficiary, Beneficiary, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BeneficiaryQueryProperty
    on QueryBuilder<Beneficiary, Beneficiary, QQueryProperty> {
  QueryBuilder<Beneficiary, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Beneficiary, String?, QQueryOperations> aadhaarNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aadhaarNumber');
    });
  }

  QueryBuilder<Beneficiary, bool, QQueryOperations> aadhaarVerifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aadhaarVerified');
    });
  }

  QueryBuilder<Beneficiary, String?, QQueryOperations> abhaNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abhaNumber');
    });
  }

  QueryBuilder<Beneficiary, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<Beneficiary, String?, QQueryOperations> cloudIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudId');
    });
  }

  QueryBuilder<Beneficiary, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Beneficiary, DateTime?, QQueryOperations> dateOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateOfBirth');
    });
  }

  QueryBuilder<Beneficiary, DateTime?, QQueryOperations>
  deliveryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryDate');
    });
  }

  QueryBuilder<Beneficiary, DateTime?, QQueryOperations>
  expectedDeliveryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedDeliveryDate');
    });
  }

  QueryBuilder<Beneficiary, bool, QQueryOperations> faceVerifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'faceVerified');
    });
  }

  QueryBuilder<Beneficiary, Gender, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<Beneficiary, String?, QQueryOperations> guardianNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guardianName');
    });
  }

  QueryBuilder<Beneficiary, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<Beneficiary, bool, QQueryOperations> isDirtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDirty');
    });
  }

  QueryBuilder<Beneficiary, double?, QQueryOperations> lastHeightCmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastHeightCm');
    });
  }

  QueryBuilder<Beneficiary, DateTime?, QQueryOperations>
  lastMenstrualPeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastMenstrualPeriod');
    });
  }

  QueryBuilder<Beneficiary, double?, QQueryOperations> lastMuacCmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastMuacCm');
    });
  }

  QueryBuilder<Beneficiary, NutritionalStatus, QQueryOperations>
  lastStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastStatus');
    });
  }

  QueryBuilder<Beneficiary, double?, QQueryOperations> lastWeightKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWeightKg');
    });
  }

  QueryBuilder<Beneficiary, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Beneficiary, String?, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<Beneficiary, String?, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<Beneficiary, String, QQueryOperations> qrCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qrCode');
    });
  }

  QueryBuilder<Beneficiary, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<Beneficiary, BeneficiaryType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Beneficiary, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
