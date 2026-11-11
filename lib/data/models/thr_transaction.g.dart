// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thr_transaction.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetThrTransactionCollection on Isar {
  IsarCollection<ThrTransaction> get thrTransactions => this.collection();
}

const ThrTransactionSchema = CollectionSchema(
  name: r'ThrTransaction',
  id: -786144406649134371,
  properties: {
    r'beneficiaryId': PropertySchema(
      id: 0,
      name: r'beneficiaryId',
      type: IsarType.long,
    ),
    r'cloudId': PropertySchema(id: 1, name: r'cloudId', type: IsarType.string),
    r'isDirty': PropertySchema(id: 2, name: r'isDirty', type: IsarType.bool),
    r'isSynced': PropertySchema(id: 3, name: r'isSynced', type: IsarType.bool),
    r'item': PropertySchema(
      id: 4,
      name: r'item',
      type: IsarType.byte,
      enumMap: _ThrTransactionitemEnumValueMap,
    ),
    r'otpRef': PropertySchema(id: 5, name: r'otpRef', type: IsarType.string),
    r'photoPath': PropertySchema(
      id: 6,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'providedAt': PropertySchema(
      id: 7,
      name: r'providedAt',
      type: IsarType.dateTime,
    ),
    r'providedByWorkerId': PropertySchema(
      id: 8,
      name: r'providedByWorkerId',
      type: IsarType.string,
    ),
    r'quantityNote': PropertySchema(
      id: 9,
      name: r'quantityNote',
      type: IsarType.string,
    ),
    r'syncedAt': PropertySchema(
      id: 10,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'verification': PropertySchema(
      id: 11,
      name: r'verification',
      type: IsarType.byte,
      enumMap: _ThrTransactionverificationEnumValueMap,
    ),
  },

  estimateSize: _thrTransactionEstimateSize,
  serialize: _thrTransactionSerialize,
  deserialize: _thrTransactionDeserialize,
  deserializeProp: _thrTransactionDeserializeProp,
  idName: r'id',
  indexes: {
    r'beneficiaryId': IndexSchema(
      id: -6961224082267517199,
      name: r'beneficiaryId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'beneficiaryId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _thrTransactionGetId,
  getLinks: _thrTransactionGetLinks,
  attach: _thrTransactionAttach,
  version: '3.3.2',
);

int _thrTransactionEstimateSize(
  ThrTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cloudId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.otpRef;
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
  {
    final value = object.providedByWorkerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.quantityNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _thrTransactionSerialize(
  ThrTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.beneficiaryId);
  writer.writeString(offsets[1], object.cloudId);
  writer.writeBool(offsets[2], object.isDirty);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeByte(offsets[4], object.item.index);
  writer.writeString(offsets[5], object.otpRef);
  writer.writeString(offsets[6], object.photoPath);
  writer.writeDateTime(offsets[7], object.providedAt);
  writer.writeString(offsets[8], object.providedByWorkerId);
  writer.writeString(offsets[9], object.quantityNote);
  writer.writeDateTime(offsets[10], object.syncedAt);
  writer.writeByte(offsets[11], object.verification.index);
}

ThrTransaction _thrTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ThrTransaction();
  object.beneficiaryId = reader.readLong(offsets[0]);
  object.cloudId = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.isDirty = reader.readBool(offsets[2]);
  object.isSynced = reader.readBool(offsets[3]);
  object.item =
      _ThrTransactionitemValueEnumMap[reader.readByteOrNull(offsets[4])] ??
      ThrItem.takeHomeRation;
  object.otpRef = reader.readStringOrNull(offsets[5]);
  object.photoPath = reader.readStringOrNull(offsets[6]);
  object.providedAt = reader.readDateTime(offsets[7]);
  object.providedByWorkerId = reader.readStringOrNull(offsets[8]);
  object.quantityNote = reader.readStringOrNull(offsets[9]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[10]);
  object.verification =
      _ThrTransactionverificationValueEnumMap[reader.readByteOrNull(
        offsets[11],
      )] ??
      VerificationMethod.qr;
  return object;
}

P _thrTransactionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_ThrTransactionitemValueEnumMap[reader.readByteOrNull(offset)] ??
              ThrItem.takeHomeRation)
          as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (_ThrTransactionverificationValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              VerificationMethod.qr)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ThrTransactionitemEnumValueMap = {
  'takeHomeRation': 0,
  'hotCookedMeal': 1,
  'supplement': 2,
};
const _ThrTransactionitemValueEnumMap = {
  0: ThrItem.takeHomeRation,
  1: ThrItem.hotCookedMeal,
  2: ThrItem.supplement,
};
const _ThrTransactionverificationEnumValueMap = {
  'qr': 0,
  'otp': 1,
  'manual': 2,
};
const _ThrTransactionverificationValueEnumMap = {
  0: VerificationMethod.qr,
  1: VerificationMethod.otp,
  2: VerificationMethod.manual,
};

Id _thrTransactionGetId(ThrTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _thrTransactionGetLinks(ThrTransaction object) {
  return [];
}

void _thrTransactionAttach(
  IsarCollection<dynamic> col,
  Id id,
  ThrTransaction object,
) {
  object.id = id;
}

extension ThrTransactionQueryWhereSort
    on QueryBuilder<ThrTransaction, ThrTransaction, QWhere> {
  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhere> anyBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'beneficiaryId'),
      );
    });
  }
}

extension ThrTransactionQueryWhere
    on QueryBuilder<ThrTransaction, ThrTransaction, QWhereClause> {
  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause> idBetween(
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause>
  beneficiaryIdEqualTo(int beneficiaryId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'beneficiaryId',
          value: [beneficiaryId],
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause>
  beneficiaryIdNotEqualTo(int beneficiaryId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'beneficiaryId',
                lower: [],
                upper: [beneficiaryId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'beneficiaryId',
                lower: [beneficiaryId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'beneficiaryId',
                lower: [beneficiaryId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'beneficiaryId',
                lower: [],
                upper: [beneficiaryId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause>
  beneficiaryIdGreaterThan(int beneficiaryId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'beneficiaryId',
          lower: [beneficiaryId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause>
  beneficiaryIdLessThan(int beneficiaryId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'beneficiaryId',
          lower: [],
          upper: [beneficiaryId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterWhereClause>
  beneficiaryIdBetween(
    int lowerBeneficiaryId,
    int upperBeneficiaryId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'beneficiaryId',
          lower: [lowerBeneficiaryId],
          includeLower: includeLower,
          upper: [upperBeneficiaryId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ThrTransactionQueryFilter
    on QueryBuilder<ThrTransaction, ThrTransaction, QFilterCondition> {
  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  beneficiaryIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'beneficiaryId', value: value),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  beneficiaryIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'beneficiaryId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  beneficiaryIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'beneficiaryId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  beneficiaryIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'beneficiaryId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdEqualTo(String? value, {bool caseSensitive = true}) {
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdLessThan(
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdBetween(
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  cloudIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  isDirtyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDirty', value: value),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSynced', value: value),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  itemEqualTo(ThrItem value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'item', value: value),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  itemGreaterThan(ThrItem value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'item',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  itemLessThan(ThrItem value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'item',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  itemBetween(
    ThrItem lower,
    ThrItem upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'item',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'otpRef'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'otpRef'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'otpRef',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'otpRef',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'otpRef',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'otpRef',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'otpRef',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'otpRef',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'otpRef',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'otpRef',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'otpRef', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  otpRefIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'otpRef', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'providedAt', value: value),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'providedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'providedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'providedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'providedByWorkerId'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'providedByWorkerId'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'providedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'providedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'providedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'providedByWorkerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'providedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'providedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'providedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'providedByWorkerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'providedByWorkerId', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  providedByWorkerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'providedByWorkerId', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'quantityNote'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'quantityNote'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'quantityNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quantityNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quantityNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quantityNote',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'quantityNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'quantityNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'quantityNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'quantityNote',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quantityNote', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  quantityNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'quantityNote', value: ''),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  syncedAtBetween(
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

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  verificationEqualTo(VerificationMethod value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'verification', value: value),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  verificationGreaterThan(VerificationMethod value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'verification',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  verificationLessThan(VerificationMethod value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'verification',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterFilterCondition>
  verificationBetween(
    VerificationMethod lower,
    VerificationMethod upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'verification',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ThrTransactionQueryObject
    on QueryBuilder<ThrTransaction, ThrTransaction, QFilterCondition> {}

extension ThrTransactionQueryLinks
    on QueryBuilder<ThrTransaction, ThrTransaction, QFilterCondition> {}

extension ThrTransactionQuerySortBy
    on QueryBuilder<ThrTransaction, ThrTransaction, QSortBy> {
  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> sortByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> sortByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> sortByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> sortByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> sortByOtpRef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otpRef', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByOtpRefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otpRef', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByProvidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAt', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByProvidedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAt', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByProvidedByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedByWorkerId', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByProvidedByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedByWorkerId', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByQuantityNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityNote', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByQuantityNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityNote', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByVerification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verification', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  sortByVerificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verification', Sort.desc);
    });
  }
}

extension ThrTransactionQuerySortThenBy
    on QueryBuilder<ThrTransaction, ThrTransaction, QSortThenBy> {
  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenByOtpRef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otpRef', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByOtpRefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otpRef', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByProvidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAt', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByProvidedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAt', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByProvidedByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedByWorkerId', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByProvidedByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedByWorkerId', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByQuantityNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityNote', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByQuantityNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityNote', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByVerification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verification', Sort.asc);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QAfterSortBy>
  thenByVerificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verification', Sort.desc);
    });
  }
}

extension ThrTransactionQueryWhereDistinct
    on QueryBuilder<ThrTransaction, ThrTransaction, QDistinct> {
  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct>
  distinctByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beneficiaryId');
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct> distinctByCloudId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct> distinctByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDirty');
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct> distinctByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'item');
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct> distinctByOtpRef({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otpRef', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct> distinctByPhotoPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct>
  distinctByProvidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'providedAt');
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct>
  distinctByProvidedByWorkerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'providedByWorkerId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct>
  distinctByQuantityNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityNote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<ThrTransaction, ThrTransaction, QDistinct>
  distinctByVerification() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verification');
    });
  }
}

extension ThrTransactionQueryProperty
    on QueryBuilder<ThrTransaction, ThrTransaction, QQueryProperty> {
  QueryBuilder<ThrTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ThrTransaction, int, QQueryOperations> beneficiaryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beneficiaryId');
    });
  }

  QueryBuilder<ThrTransaction, String?, QQueryOperations> cloudIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudId');
    });
  }

  QueryBuilder<ThrTransaction, bool, QQueryOperations> isDirtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDirty');
    });
  }

  QueryBuilder<ThrTransaction, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ThrTransaction, ThrItem, QQueryOperations> itemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'item');
    });
  }

  QueryBuilder<ThrTransaction, String?, QQueryOperations> otpRefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otpRef');
    });
  }

  QueryBuilder<ThrTransaction, String?, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<ThrTransaction, DateTime, QQueryOperations>
  providedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'providedAt');
    });
  }

  QueryBuilder<ThrTransaction, String?, QQueryOperations>
  providedByWorkerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'providedByWorkerId');
    });
  }

  QueryBuilder<ThrTransaction, String?, QQueryOperations>
  quantityNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityNote');
    });
  }

  QueryBuilder<ThrTransaction, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<ThrTransaction, VerificationMethod, QQueryOperations>
  verificationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verification');
    });
  }
}
