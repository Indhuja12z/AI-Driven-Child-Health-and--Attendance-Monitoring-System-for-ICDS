// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_referral.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClinicReferralCollection on Isar {
  IsarCollection<ClinicReferral> get clinicReferrals => this.collection();
}

const ClinicReferralSchema = CollectionSchema(
  name: r'ClinicReferral',
  id: 2847094397833733512,
  properties: {
    r'awwDecisionBy': PropertySchema(
      id: 0,
      name: r'awwDecisionBy',
      type: IsarType.string,
    ),
    r'beneficiaryId': PropertySchema(
      id: 1,
      name: r'beneficiaryId',
      type: IsarType.long,
    ),
    r'clinicName': PropertySchema(
      id: 2,
      name: r'clinicName',
      type: IsarType.string,
    ),
    r'clinicPhone': PropertySchema(
      id: 3,
      name: r'clinicPhone',
      type: IsarType.string,
    ),
    r'cloudId': PropertySchema(id: 4, name: r'cloudId', type: IsarType.string),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'decisionAt': PropertySchema(
      id: 6,
      name: r'decisionAt',
      type: IsarType.dateTime,
    ),
    r'isDirty': PropertySchema(id: 7, name: r'isDirty', type: IsarType.bool),
    r'isSynced': PropertySchema(id: 8, name: r'isSynced', type: IsarType.bool),
    r'reason': PropertySchema(id: 9, name: r'reason', type: IsarType.string),
    r'sentAt': PropertySchema(id: 10, name: r'sentAt', type: IsarType.dateTime),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.byte,
      enumMap: _ClinicReferralstatusEnumValueMap,
    ),
    r'syncedAt': PropertySchema(
      id: 12,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _clinicReferralEstimateSize,
  serialize: _clinicReferralSerialize,
  deserialize: _clinicReferralDeserialize,
  deserializeProp: _clinicReferralDeserializeProp,
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

  getId: _clinicReferralGetId,
  getLinks: _clinicReferralGetLinks,
  attach: _clinicReferralAttach,
  version: '3.3.2',
);

int _clinicReferralEstimateSize(
  ClinicReferral object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.awwDecisionBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.clinicName.length * 3;
  bytesCount += 3 + object.clinicPhone.length * 3;
  {
    final value = object.cloudId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.reason.length * 3;
  return bytesCount;
}

void _clinicReferralSerialize(
  ClinicReferral object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.awwDecisionBy);
  writer.writeLong(offsets[1], object.beneficiaryId);
  writer.writeString(offsets[2], object.clinicName);
  writer.writeString(offsets[3], object.clinicPhone);
  writer.writeString(offsets[4], object.cloudId);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeDateTime(offsets[6], object.decisionAt);
  writer.writeBool(offsets[7], object.isDirty);
  writer.writeBool(offsets[8], object.isSynced);
  writer.writeString(offsets[9], object.reason);
  writer.writeDateTime(offsets[10], object.sentAt);
  writer.writeByte(offsets[11], object.status.index);
  writer.writeDateTime(offsets[12], object.syncedAt);
}

ClinicReferral _clinicReferralDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClinicReferral();
  object.awwDecisionBy = reader.readStringOrNull(offsets[0]);
  object.beneficiaryId = reader.readLong(offsets[1]);
  object.clinicName = reader.readString(offsets[2]);
  object.clinicPhone = reader.readString(offsets[3]);
  object.cloudId = reader.readStringOrNull(offsets[4]);
  object.createdAt = reader.readDateTime(offsets[5]);
  object.decisionAt = reader.readDateTimeOrNull(offsets[6]);
  object.id = id;
  object.isDirty = reader.readBool(offsets[7]);
  object.isSynced = reader.readBool(offsets[8]);
  object.reason = reader.readString(offsets[9]);
  object.sentAt = reader.readDateTimeOrNull(offsets[10]);
  object.status =
      _ClinicReferralstatusValueEnumMap[reader.readByteOrNull(offsets[11])] ??
      ReferralStatus.pendingApproval;
  object.syncedAt = reader.readDateTimeOrNull(offsets[12]);
  return object;
}

P _clinicReferralDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (_ClinicReferralstatusValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              ReferralStatus.pendingApproval)
          as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ClinicReferralstatusEnumValueMap = {
  'pendingApproval': 0,
  'sent': 1,
  'dismissed': 2,
};
const _ClinicReferralstatusValueEnumMap = {
  0: ReferralStatus.pendingApproval,
  1: ReferralStatus.sent,
  2: ReferralStatus.dismissed,
};

Id _clinicReferralGetId(ClinicReferral object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clinicReferralGetLinks(ClinicReferral object) {
  return [];
}

void _clinicReferralAttach(
  IsarCollection<dynamic> col,
  Id id,
  ClinicReferral object,
) {
  object.id = id;
}

extension ClinicReferralQueryWhereSort
    on QueryBuilder<ClinicReferral, ClinicReferral, QWhere> {
  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhere> anyBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'beneficiaryId'),
      );
    });
  }
}

extension ClinicReferralQueryWhere
    on QueryBuilder<ClinicReferral, ClinicReferral, QWhereClause> {
  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause> idBetween(
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterWhereClause>
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

extension ClinicReferralQueryFilter
    on QueryBuilder<ClinicReferral, ClinicReferral, QFilterCondition> {
  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'awwDecisionBy'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'awwDecisionBy'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'awwDecisionBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'awwDecisionBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'awwDecisionBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'awwDecisionBy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'awwDecisionBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'awwDecisionBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'awwDecisionBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'awwDecisionBy',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'awwDecisionBy', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  awwDecisionByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'awwDecisionBy', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  beneficiaryIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'beneficiaryId', value: value),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clinicName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clinicName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clinicName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clinicName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'clinicName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'clinicName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'clinicName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'clinicName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clinicName', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'clinicName', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clinicPhone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clinicPhone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clinicPhone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clinicPhone',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'clinicPhone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'clinicPhone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'clinicPhone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'clinicPhone',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clinicPhone', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  clinicPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'clinicPhone', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  cloudIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  cloudIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  cloudIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  cloudIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  decisionAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'decisionAt'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  decisionAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'decisionAt'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  decisionAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'decisionAt', value: value),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  decisionAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'decisionAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  decisionAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'decisionAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  decisionAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'decisionAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  isDirtyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDirty', value: value),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSynced', value: value),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reason',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reason',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reason', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  reasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reason', value: ''),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  sentAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sentAt'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  sentAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sentAt'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  sentAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sentAt', value: value),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  sentAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sentAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  sentAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sentAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  sentAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sentAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  statusEqualTo(ReferralStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  statusGreaterThan(ReferralStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  statusLessThan(ReferralStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  statusBetween(
    ReferralStatus lower,
    ReferralStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
  syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterFilterCondition>
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
}

extension ClinicReferralQueryObject
    on QueryBuilder<ClinicReferral, ClinicReferral, QFilterCondition> {}

extension ClinicReferralQueryLinks
    on QueryBuilder<ClinicReferral, ClinicReferral, QFilterCondition> {}

extension ClinicReferralQuerySortBy
    on QueryBuilder<ClinicReferral, ClinicReferral, QSortBy> {
  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByAwwDecisionBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awwDecisionBy', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByAwwDecisionByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awwDecisionBy', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByClinicName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicName', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByClinicNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicName', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByClinicPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicPhone', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByClinicPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicPhone', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> sortByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByDecisionAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionAt', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByDecisionAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionAt', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> sortByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> sortByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> sortBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortBySentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }
}

extension ClinicReferralQuerySortThenBy
    on QueryBuilder<ClinicReferral, ClinicReferral, QSortThenBy> {
  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByAwwDecisionBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awwDecisionBy', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByAwwDecisionByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awwDecisionBy', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByClinicName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicName', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByClinicNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicName', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByClinicPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicPhone', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByClinicPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicPhone', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByDecisionAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionAt', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByDecisionAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionAt', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenBySentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QAfterSortBy>
  thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }
}

extension ClinicReferralQueryWhereDistinct
    on QueryBuilder<ClinicReferral, ClinicReferral, QDistinct> {
  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct>
  distinctByAwwDecisionBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'awwDecisionBy',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct>
  distinctByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beneficiaryId');
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct> distinctByClinicName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clinicName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct>
  distinctByClinicPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clinicPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct> distinctByCloudId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct>
  distinctByDecisionAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'decisionAt');
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct> distinctByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDirty');
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct> distinctByReason({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reason', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct> distinctBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sentAt');
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<ClinicReferral, ClinicReferral, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }
}

extension ClinicReferralQueryProperty
    on QueryBuilder<ClinicReferral, ClinicReferral, QQueryProperty> {
  QueryBuilder<ClinicReferral, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClinicReferral, String?, QQueryOperations>
  awwDecisionByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'awwDecisionBy');
    });
  }

  QueryBuilder<ClinicReferral, int, QQueryOperations> beneficiaryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beneficiaryId');
    });
  }

  QueryBuilder<ClinicReferral, String, QQueryOperations> clinicNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clinicName');
    });
  }

  QueryBuilder<ClinicReferral, String, QQueryOperations> clinicPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clinicPhone');
    });
  }

  QueryBuilder<ClinicReferral, String?, QQueryOperations> cloudIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudId');
    });
  }

  QueryBuilder<ClinicReferral, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ClinicReferral, DateTime?, QQueryOperations>
  decisionAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'decisionAt');
    });
  }

  QueryBuilder<ClinicReferral, bool, QQueryOperations> isDirtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDirty');
    });
  }

  QueryBuilder<ClinicReferral, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ClinicReferral, String, QQueryOperations> reasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reason');
    });
  }

  QueryBuilder<ClinicReferral, DateTime?, QQueryOperations> sentAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sentAt');
    });
  }

  QueryBuilder<ClinicReferral, ReferralStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ClinicReferral, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }
}
