// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGrowthRecordCollection on Isar {
  IsarCollection<GrowthRecord> get growthRecords => this.collection();
}

const GrowthRecordSchema = CollectionSchema(
  name: r'GrowthRecord',
  id: 8924463545612260827,
  properties: {
    r'baz': PropertySchema(id: 0, name: r'baz', type: IsarType.double),
    r'beneficiaryId': PropertySchema(
      id: 1,
      name: r'beneficiaryId',
      type: IsarType.long,
    ),
    r'cloudId': PropertySchema(id: 2, name: r'cloudId', type: IsarType.string),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'haz': PropertySchema(id: 4, name: r'haz', type: IsarType.double),
    r'heightCm': PropertySchema(
      id: 5,
      name: r'heightCm',
      type: IsarType.double,
    ),
    r'isDirty': PropertySchema(id: 6, name: r'isDirty', type: IsarType.bool),
    r'measuredAt': PropertySchema(
      id: 7,
      name: r'measuredAt',
      type: IsarType.dateTime,
    ),
    r'muacCm': PropertySchema(id: 8, name: r'muacCm', type: IsarType.double),
    r'note': PropertySchema(id: 9, name: r'note', type: IsarType.string),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _GrowthRecordstatusEnumValueMap,
    ),
    r'syncedAt': PropertySchema(
      id: 11,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'waz': PropertySchema(id: 12, name: r'waz', type: IsarType.double),
    r'weightKg': PropertySchema(
      id: 13,
      name: r'weightKg',
      type: IsarType.double,
    ),
    r'whz': PropertySchema(id: 14, name: r'whz', type: IsarType.double),
  },

  estimateSize: _growthRecordEstimateSize,
  serialize: _growthRecordSerialize,
  deserialize: _growthRecordDeserialize,
  deserializeProp: _growthRecordDeserializeProp,
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

  getId: _growthRecordGetId,
  getLinks: _growthRecordGetLinks,
  attach: _growthRecordAttach,
  version: '3.3.2',
);

int _growthRecordEstimateSize(
  GrowthRecord object,
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
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _growthRecordSerialize(
  GrowthRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.baz);
  writer.writeLong(offsets[1], object.beneficiaryId);
  writer.writeString(offsets[2], object.cloudId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDouble(offsets[4], object.haz);
  writer.writeDouble(offsets[5], object.heightCm);
  writer.writeBool(offsets[6], object.isDirty);
  writer.writeDateTime(offsets[7], object.measuredAt);
  writer.writeDouble(offsets[8], object.muacCm);
  writer.writeString(offsets[9], object.note);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeDateTime(offsets[11], object.syncedAt);
  writer.writeDouble(offsets[12], object.waz);
  writer.writeDouble(offsets[13], object.weightKg);
  writer.writeDouble(offsets[14], object.whz);
}

GrowthRecord _growthRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GrowthRecord();
  object.baz = reader.readDoubleOrNull(offsets[0]);
  object.beneficiaryId = reader.readLong(offsets[1]);
  object.cloudId = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.haz = reader.readDoubleOrNull(offsets[4]);
  object.heightCm = reader.readDouble(offsets[5]);
  object.id = id;
  object.isDirty = reader.readBool(offsets[6]);
  object.measuredAt = reader.readDateTime(offsets[7]);
  object.muacCm = reader.readDoubleOrNull(offsets[8]);
  object.note = reader.readStringOrNull(offsets[9]);
  object.status =
      _GrowthRecordstatusValueEnumMap[reader.readByteOrNull(offsets[10])] ??
      NutritionalStatus.normal;
  object.syncedAt = reader.readDateTimeOrNull(offsets[11]);
  object.waz = reader.readDoubleOrNull(offsets[12]);
  object.weightKg = reader.readDouble(offsets[13]);
  object.whz = reader.readDoubleOrNull(offsets[14]);
  return object;
}

P _growthRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_GrowthRecordstatusValueEnumMap[reader.readByteOrNull(offset)] ??
              NutritionalStatus.normal)
          as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _GrowthRecordstatusEnumValueMap = {
  'normal': 0,
  'mam': 1,
  'sam': 2,
  'stunted': 3,
  'wasted': 4,
  'underweight': 5,
  'overweight': 6,
};
const _GrowthRecordstatusValueEnumMap = {
  0: NutritionalStatus.normal,
  1: NutritionalStatus.mam,
  2: NutritionalStatus.sam,
  3: NutritionalStatus.stunted,
  4: NutritionalStatus.wasted,
  5: NutritionalStatus.underweight,
  6: NutritionalStatus.overweight,
};

Id _growthRecordGetId(GrowthRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _growthRecordGetLinks(GrowthRecord object) {
  return [];
}

void _growthRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  GrowthRecord object,
) {
  object.id = id;
}

extension GrowthRecordQueryWhereSort
    on QueryBuilder<GrowthRecord, GrowthRecord, QWhere> {
  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhere> anyBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'beneficiaryId'),
      );
    });
  }
}

extension GrowthRecordQueryWhere
    on QueryBuilder<GrowthRecord, GrowthRecord, QWhereClause> {
  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause> idBetween(
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterWhereClause>
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

extension GrowthRecordQueryFilter
    on QueryBuilder<GrowthRecord, GrowthRecord, QFilterCondition> {
  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> bazIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'baz'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  bazIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'baz'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> bazEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'baz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  bazGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'baz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> bazLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'baz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> bazBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'baz',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  beneficiaryIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'beneficiaryId', value: value),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  cloudIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  cloudIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  cloudIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  cloudIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> hazIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'haz'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  hazIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'haz'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> hazEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'haz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  hazGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'haz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> hazLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'haz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> hazBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'haz',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  heightCmEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'heightCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  heightCmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'heightCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  heightCmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'heightCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  heightCmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'heightCm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  isDirtyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDirty', value: value),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  measuredAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'measuredAt', value: value),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  measuredAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'measuredAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  measuredAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'measuredAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  measuredAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'measuredAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  muacCmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'muacCm'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  muacCmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'muacCm'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> muacCmEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'muacCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  muacCmGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'muacCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  muacCmLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'muacCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> muacCmBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'muacCm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'note'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'note'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'note',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  noteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> noteContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> noteMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'note',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> statusEqualTo(
    NutritionalStatus value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  statusGreaterThan(NutritionalStatus value, {bool include = false}) {
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  statusLessThan(NutritionalStatus value, {bool include = false}) {
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> statusBetween(
    NutritionalStatus lower,
    NutritionalStatus upper, {
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
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

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> wazIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'waz'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  wazIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'waz'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> wazEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'waz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  wazGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'waz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> wazLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'waz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> wazBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'waz',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  weightKgEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'weightKg',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  weightKgGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weightKg',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  weightKgLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weightKg',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  weightKgBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weightKg',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> whzIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'whz'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  whzIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'whz'),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> whzEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'whz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition>
  whzGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'whz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> whzLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'whz',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterFilterCondition> whzBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'whz',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }
}

extension GrowthRecordQueryObject
    on QueryBuilder<GrowthRecord, GrowthRecord, QFilterCondition> {}

extension GrowthRecordQueryLinks
    on QueryBuilder<GrowthRecord, GrowthRecord, QFilterCondition> {}

extension GrowthRecordQuerySortBy
    on QueryBuilder<GrowthRecord, GrowthRecord, QSortBy> {
  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByBaz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baz', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByBazDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baz', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy>
  sortByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByHaz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haz', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByHazDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haz', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByHeightCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightCm', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByHeightCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightCm', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByMeasuredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measuredAt', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy>
  sortByMeasuredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measuredAt', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByMuacCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muacCm', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByMuacCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muacCm', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByWaz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waz', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByWazDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waz', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByWeightKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByWhz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whz', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> sortByWhzDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whz', Sort.desc);
    });
  }
}

extension GrowthRecordQuerySortThenBy
    on QueryBuilder<GrowthRecord, GrowthRecord, QSortThenBy> {
  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByBaz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baz', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByBazDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baz', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy>
  thenByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByHaz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haz', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByHazDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haz', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByHeightCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightCm', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByHeightCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightCm', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByMeasuredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measuredAt', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy>
  thenByMeasuredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measuredAt', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByMuacCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muacCm', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByMuacCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muacCm', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByWaz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waz', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByWazDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waz', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByWeightKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.desc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByWhz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whz', Sort.asc);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QAfterSortBy> thenByWhzDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whz', Sort.desc);
    });
  }
}

extension GrowthRecordQueryWhereDistinct
    on QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> {
  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByBaz() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baz');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct>
  distinctByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beneficiaryId');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByCloudId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByHaz() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'haz');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByHeightCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'heightCm');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDirty');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByMeasuredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measuredAt');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByMuacCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'muacCm');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByNote({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByWaz() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waz');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightKg');
    });
  }

  QueryBuilder<GrowthRecord, GrowthRecord, QDistinct> distinctByWhz() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'whz');
    });
  }
}

extension GrowthRecordQueryProperty
    on QueryBuilder<GrowthRecord, GrowthRecord, QQueryProperty> {
  QueryBuilder<GrowthRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GrowthRecord, double?, QQueryOperations> bazProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baz');
    });
  }

  QueryBuilder<GrowthRecord, int, QQueryOperations> beneficiaryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beneficiaryId');
    });
  }

  QueryBuilder<GrowthRecord, String?, QQueryOperations> cloudIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudId');
    });
  }

  QueryBuilder<GrowthRecord, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<GrowthRecord, double?, QQueryOperations> hazProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'haz');
    });
  }

  QueryBuilder<GrowthRecord, double, QQueryOperations> heightCmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'heightCm');
    });
  }

  QueryBuilder<GrowthRecord, bool, QQueryOperations> isDirtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDirty');
    });
  }

  QueryBuilder<GrowthRecord, DateTime, QQueryOperations> measuredAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measuredAt');
    });
  }

  QueryBuilder<GrowthRecord, double?, QQueryOperations> muacCmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'muacCm');
    });
  }

  QueryBuilder<GrowthRecord, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<GrowthRecord, NutritionalStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<GrowthRecord, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<GrowthRecord, double?, QQueryOperations> wazProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waz');
    });
  }

  QueryBuilder<GrowthRecord, double, QQueryOperations> weightKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightKg');
    });
  }

  QueryBuilder<GrowthRecord, double?, QQueryOperations> whzProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'whz');
    });
  }
}
