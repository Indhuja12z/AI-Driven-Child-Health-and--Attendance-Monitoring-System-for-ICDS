// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_visit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHomeVisitCollection on Isar {
  IsarCollection<HomeVisit> get homeVisits => this.collection();
}

const HomeVisitSchema = CollectionSchema(
  name: r'HomeVisit',
  id: -8925942220411846821,
  properties: {
    r'beneficiaryId': PropertySchema(
      id: 0,
      name: r'beneficiaryId',
      type: IsarType.long,
    ),
    r'cloudId': PropertySchema(id: 1, name: r'cloudId', type: IsarType.string),
    r'completedAt': PropertySchema(
      id: 2,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'isDirty': PropertySchema(id: 3, name: r'isDirty', type: IsarType.bool),
    r'isSynced': PropertySchema(id: 4, name: r'isSynced', type: IsarType.bool),
    r'notes': PropertySchema(id: 5, name: r'notes', type: IsarType.string),
    r'photoPath': PropertySchema(
      id: 6,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'reason': PropertySchema(
      id: 7,
      name: r'reason',
      type: IsarType.byte,
      enumMap: _HomeVisitreasonEnumValueMap,
    ),
    r'scheduledFor': PropertySchema(
      id: 8,
      name: r'scheduledFor',
      type: IsarType.dateTime,
    ),
    r'severity': PropertySchema(
      id: 9,
      name: r'severity',
      type: IsarType.byte,
      enumMap: _HomeVisitseverityEnumValueMap,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _HomeVisitstatusEnumValueMap,
    ),
    r'syncedAt': PropertySchema(
      id: 11,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _homeVisitEstimateSize,
  serialize: _homeVisitSerialize,
  deserialize: _homeVisitDeserialize,
  deserializeProp: _homeVisitDeserializeProp,
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

  getId: _homeVisitGetId,
  getLinks: _homeVisitGetLinks,
  attach: _homeVisitAttach,
  version: '3.3.2',
);

int _homeVisitEstimateSize(
  HomeVisit object,
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
    final value = object.notes;
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
  return bytesCount;
}

void _homeVisitSerialize(
  HomeVisit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.beneficiaryId);
  writer.writeString(offsets[1], object.cloudId);
  writer.writeDateTime(offsets[2], object.completedAt);
  writer.writeBool(offsets[3], object.isDirty);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeString(offsets[5], object.notes);
  writer.writeString(offsets[6], object.photoPath);
  writer.writeByte(offsets[7], object.reason.index);
  writer.writeDateTime(offsets[8], object.scheduledFor);
  writer.writeByte(offsets[9], object.severity.index);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeDateTime(offsets[11], object.syncedAt);
}

HomeVisit _homeVisitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HomeVisit();
  object.beneficiaryId = reader.readLong(offsets[0]);
  object.cloudId = reader.readStringOrNull(offsets[1]);
  object.completedAt = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.isDirty = reader.readBool(offsets[3]);
  object.isSynced = reader.readBool(offsets[4]);
  object.notes = reader.readStringOrNull(offsets[5]);
  object.photoPath = reader.readStringOrNull(offsets[6]);
  object.reason =
      _HomeVisitreasonValueEnumMap[reader.readByteOrNull(offsets[7])] ??
      VisitReason.newbornCare;
  object.scheduledFor = reader.readDateTime(offsets[8]);
  object.severity =
      _HomeVisitseverityValueEnumMap[reader.readByteOrNull(offsets[9])] ??
      VisitSeverity.high;
  object.status =
      _HomeVisitstatusValueEnumMap[reader.readByteOrNull(offsets[10])] ??
      VisitStatus.due;
  object.syncedAt = reader.readDateTimeOrNull(offsets[11]);
  return object;
}

P _homeVisitDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_HomeVisitreasonValueEnumMap[reader.readByteOrNull(offset)] ??
              VisitReason.newbornCare)
          as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (_HomeVisitseverityValueEnumMap[reader.readByteOrNull(offset)] ??
              VisitSeverity.high)
          as P;
    case 10:
      return (_HomeVisitstatusValueEnumMap[reader.readByteOrNull(offset)] ??
              VisitStatus.due)
          as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _HomeVisitreasonEnumValueMap = {
  'newbornCare': 0,
  'pregnancyMilestone': 1,
  'growthConcern': 2,
  'routine': 3,
};
const _HomeVisitreasonValueEnumMap = {
  0: VisitReason.newbornCare,
  1: VisitReason.pregnancyMilestone,
  2: VisitReason.growthConcern,
  3: VisitReason.routine,
};
const _HomeVisitseverityEnumValueMap = {'high': 0, 'moderate': 1, 'low': 2};
const _HomeVisitseverityValueEnumMap = {
  0: VisitSeverity.high,
  1: VisitSeverity.moderate,
  2: VisitSeverity.low,
};
const _HomeVisitstatusEnumValueMap = {'due': 0, 'completed': 1, 'missed': 2};
const _HomeVisitstatusValueEnumMap = {
  0: VisitStatus.due,
  1: VisitStatus.completed,
  2: VisitStatus.missed,
};

Id _homeVisitGetId(HomeVisit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _homeVisitGetLinks(HomeVisit object) {
  return [];
}

void _homeVisitAttach(IsarCollection<dynamic> col, Id id, HomeVisit object) {
  object.id = id;
}

extension HomeVisitQueryWhereSort
    on QueryBuilder<HomeVisit, HomeVisit, QWhere> {
  QueryBuilder<HomeVisit, HomeVisit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhere> anyBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'beneficiaryId'),
      );
    });
  }
}

extension HomeVisitQueryWhere
    on QueryBuilder<HomeVisit, HomeVisit, QWhereClause> {
  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause> idBetween(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause> beneficiaryIdEqualTo(
    int beneficiaryId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'beneficiaryId',
          value: [beneficiaryId],
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause> beneficiaryIdNotEqualTo(
    int beneficiaryId,
  ) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause>
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause> beneficiaryIdLessThan(
    int beneficiaryId, {
    bool include = false,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterWhereClause> beneficiaryIdBetween(
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

extension HomeVisitQueryFilter
    on QueryBuilder<HomeVisit, HomeVisit, QFilterCondition> {
  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  beneficiaryIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'beneficiaryId', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdEqualTo(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdGreaterThan(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdLessThan(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdBetween(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdEndsWith(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdContains(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdMatches(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> cloudIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  cloudIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> completedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedAt', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  completedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> idBetween(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> isDirtyEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDirty', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> isSyncedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSynced', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'notes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> photoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> photoPathLessThan(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> photoPathBetween(
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> photoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> photoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> photoPathContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> photoPathMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> reasonEqualTo(
    VisitReason value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reason', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> reasonGreaterThan(
    VisitReason value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reason',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> reasonLessThan(
    VisitReason value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reason',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> reasonBetween(
    VisitReason lower,
    VisitReason upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reason',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> scheduledForEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scheduledFor', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  scheduledForGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scheduledFor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  scheduledForLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scheduledFor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> scheduledForBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scheduledFor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> severityEqualTo(
    VisitSeverity value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'severity', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> severityGreaterThan(
    VisitSeverity value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'severity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> severityLessThan(
    VisitSeverity value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'severity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> severityBetween(
    VisitSeverity lower,
    VisitSeverity upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'severity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> statusEqualTo(
    VisitStatus value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> statusGreaterThan(
    VisitStatus value, {
    bool include = false,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> statusLessThan(
    VisitStatus value, {
    bool include = false,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> statusBetween(
    VisitStatus lower,
    VisitStatus upper, {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition>
  syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> syncedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> syncedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> syncedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
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

  QueryBuilder<HomeVisit, HomeVisit, QAfterFilterCondition> syncedAtBetween(
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

extension HomeVisitQueryObject
    on QueryBuilder<HomeVisit, HomeVisit, QFilterCondition> {}

extension HomeVisitQueryLinks
    on QueryBuilder<HomeVisit, HomeVisit, QFilterCondition> {}

extension HomeVisitQuerySortBy on QueryBuilder<HomeVisit, HomeVisit, QSortBy> {
  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByScheduledFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledFor', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByScheduledForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledFor', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortBySeverity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severity', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortBySeverityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severity', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }
}

extension HomeVisitQuerySortThenBy
    on QueryBuilder<HomeVisit, HomeVisit, QSortThenBy> {
  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByScheduledFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledFor', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByScheduledForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledFor', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenBySeverity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severity', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenBySeverityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severity', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }
}

extension HomeVisitQueryWhereDistinct
    on QueryBuilder<HomeVisit, HomeVisit, QDistinct> {
  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beneficiaryId');
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByCloudId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDirty');
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByPhotoPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reason');
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByScheduledFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledFor');
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctBySeverity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'severity');
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<HomeVisit, HomeVisit, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }
}

extension HomeVisitQueryProperty
    on QueryBuilder<HomeVisit, HomeVisit, QQueryProperty> {
  QueryBuilder<HomeVisit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HomeVisit, int, QQueryOperations> beneficiaryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beneficiaryId');
    });
  }

  QueryBuilder<HomeVisit, String?, QQueryOperations> cloudIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudId');
    });
  }

  QueryBuilder<HomeVisit, DateTime?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<HomeVisit, bool, QQueryOperations> isDirtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDirty');
    });
  }

  QueryBuilder<HomeVisit, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<HomeVisit, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<HomeVisit, String?, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<HomeVisit, VisitReason, QQueryOperations> reasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reason');
    });
  }

  QueryBuilder<HomeVisit, DateTime, QQueryOperations> scheduledForProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledFor');
    });
  }

  QueryBuilder<HomeVisit, VisitSeverity, QQueryOperations> severityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'severity');
    });
  }

  QueryBuilder<HomeVisit, VisitStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<HomeVisit, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }
}
