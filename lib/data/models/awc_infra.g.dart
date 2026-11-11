// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'awc_infra.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAwcInfraCollection on Isar {
  IsarCollection<AwcInfra> get awcInfras => this.collection();
}

const AwcInfraSchema = CollectionSchema(
  name: r'AwcInfra',
  id: 2867010480991689311,
  properties: {
    r'auditedAt': PropertySchema(
      id: 0,
      name: r'auditedAt',
      type: IsarType.dateTime,
    ),
    r'hasDrinkingWater': PropertySchema(
      id: 1,
      name: r'hasDrinkingWater',
      type: IsarType.bool,
    ),
    r'hasElectricity': PropertySchema(
      id: 2,
      name: r'hasElectricity',
      type: IsarType.bool,
    ),
    r'hasHygieneSupplies': PropertySchema(
      id: 3,
      name: r'hasHygieneSupplies',
      type: IsarType.bool,
    ),
    r'hasToilet': PropertySchema(
      id: 4,
      name: r'hasToilet',
      type: IsarType.bool,
    ),
    r'isBuildingSafe': PropertySchema(
      id: 5,
      name: r'isBuildingSafe',
      type: IsarType.bool,
    ),
    r'isDirty': PropertySchema(id: 6, name: r'isDirty', type: IsarType.bool),
    r'isSynced': PropertySchema(id: 7, name: r'isSynced', type: IsarType.bool),
    r'latitude': PropertySchema(
      id: 8,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 9,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'notes': PropertySchema(id: 10, name: r'notes', type: IsarType.string),
    r'photoPath': PropertySchema(
      id: 11,
      name: r'photoPath',
      type: IsarType.string,
    ),
  },

  estimateSize: _awcInfraEstimateSize,
  serialize: _awcInfraSerialize,
  deserialize: _awcInfraDeserialize,
  deserializeProp: _awcInfraDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _awcInfraGetId,
  getLinks: _awcInfraGetLinks,
  attach: _awcInfraAttach,
  version: '3.3.2',
);

int _awcInfraEstimateSize(
  AwcInfra object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
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

void _awcInfraSerialize(
  AwcInfra object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.auditedAt);
  writer.writeBool(offsets[1], object.hasDrinkingWater);
  writer.writeBool(offsets[2], object.hasElectricity);
  writer.writeBool(offsets[3], object.hasHygieneSupplies);
  writer.writeBool(offsets[4], object.hasToilet);
  writer.writeBool(offsets[5], object.isBuildingSafe);
  writer.writeBool(offsets[6], object.isDirty);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeDouble(offsets[8], object.latitude);
  writer.writeDouble(offsets[9], object.longitude);
  writer.writeString(offsets[10], object.notes);
  writer.writeString(offsets[11], object.photoPath);
}

AwcInfra _awcInfraDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AwcInfra();
  object.auditedAt = reader.readDateTime(offsets[0]);
  object.hasDrinkingWater = reader.readBool(offsets[1]);
  object.hasElectricity = reader.readBool(offsets[2]);
  object.hasHygieneSupplies = reader.readBool(offsets[3]);
  object.hasToilet = reader.readBool(offsets[4]);
  object.id = id;
  object.isBuildingSafe = reader.readBool(offsets[5]);
  object.isDirty = reader.readBool(offsets[6]);
  object.isSynced = reader.readBool(offsets[7]);
  object.latitude = reader.readDoubleOrNull(offsets[8]);
  object.longitude = reader.readDoubleOrNull(offsets[9]);
  object.notes = reader.readStringOrNull(offsets[10]);
  object.photoPath = reader.readStringOrNull(offsets[11]);
  return object;
}

P _awcInfraDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _awcInfraGetId(AwcInfra object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _awcInfraGetLinks(AwcInfra object) {
  return [];
}

void _awcInfraAttach(IsarCollection<dynamic> col, Id id, AwcInfra object) {
  object.id = id;
}

extension AwcInfraQueryWhereSort on QueryBuilder<AwcInfra, AwcInfra, QWhere> {
  QueryBuilder<AwcInfra, AwcInfra, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AwcInfraQueryWhere on QueryBuilder<AwcInfra, AwcInfra, QWhereClause> {
  QueryBuilder<AwcInfra, AwcInfra, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterWhereClause> idBetween(
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
}

extension AwcInfraQueryFilter
    on QueryBuilder<AwcInfra, AwcInfra, QFilterCondition> {
  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> auditedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'auditedAt', value: value),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> auditedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'auditedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> auditedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'auditedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> auditedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'auditedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition>
  hasDrinkingWaterEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasDrinkingWater', value: value),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> hasElectricityEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasElectricity', value: value),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition>
  hasHygieneSuppliesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasHygieneSupplies', value: value),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> hasToiletEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasToilet', value: value),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> isBuildingSafeEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isBuildingSafe', value: value),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> isDirtyEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDirty', value: value),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> isSyncedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSynced', value: value),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'latitude'),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'latitude'),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> latitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> latitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> latitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> latitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'latitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'longitude'),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'longitude'),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> longitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> longitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> longitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> longitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'longitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesContains(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathEqualTo(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathGreaterThan(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathLessThan(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathBetween(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathStartsWith(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathEndsWith(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathContains(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathMatches(
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

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition> photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterFilterCondition>
  photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoPath', value: ''),
      );
    });
  }
}

extension AwcInfraQueryObject
    on QueryBuilder<AwcInfra, AwcInfra, QFilterCondition> {}

extension AwcInfraQueryLinks
    on QueryBuilder<AwcInfra, AwcInfra, QFilterCondition> {}

extension AwcInfraQuerySortBy on QueryBuilder<AwcInfra, AwcInfra, QSortBy> {
  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByAuditedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditedAt', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByAuditedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditedAt', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByHasDrinkingWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDrinkingWater', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByHasDrinkingWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDrinkingWater', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByHasElectricity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasElectricity', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByHasElectricityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasElectricity', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByHasHygieneSupplies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasHygieneSupplies', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy>
  sortByHasHygieneSuppliesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasHygieneSupplies', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByHasToilet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasToilet', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByHasToiletDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasToilet', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByIsBuildingSafe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBuildingSafe', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByIsBuildingSafeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBuildingSafe', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }
}

extension AwcInfraQuerySortThenBy
    on QueryBuilder<AwcInfra, AwcInfra, QSortThenBy> {
  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByAuditedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditedAt', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByAuditedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditedAt', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByHasDrinkingWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDrinkingWater', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByHasDrinkingWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDrinkingWater', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByHasElectricity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasElectricity', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByHasElectricityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasElectricity', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByHasHygieneSupplies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasHygieneSupplies', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy>
  thenByHasHygieneSuppliesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasHygieneSupplies', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByHasToilet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasToilet', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByHasToiletDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasToilet', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByIsBuildingSafe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBuildingSafe', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByIsBuildingSafeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBuildingSafe', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QAfterSortBy> thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }
}

extension AwcInfraQueryWhereDistinct
    on QueryBuilder<AwcInfra, AwcInfra, QDistinct> {
  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByAuditedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditedAt');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByHasDrinkingWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasDrinkingWater');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByHasElectricity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasElectricity');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByHasHygieneSupplies() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasHygieneSupplies');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByHasToilet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasToilet');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByIsBuildingSafe() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBuildingSafe');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDirty');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AwcInfra, AwcInfra, QDistinct> distinctByPhotoPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }
}

extension AwcInfraQueryProperty
    on QueryBuilder<AwcInfra, AwcInfra, QQueryProperty> {
  QueryBuilder<AwcInfra, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AwcInfra, DateTime, QQueryOperations> auditedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditedAt');
    });
  }

  QueryBuilder<AwcInfra, bool, QQueryOperations> hasDrinkingWaterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasDrinkingWater');
    });
  }

  QueryBuilder<AwcInfra, bool, QQueryOperations> hasElectricityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasElectricity');
    });
  }

  QueryBuilder<AwcInfra, bool, QQueryOperations> hasHygieneSuppliesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasHygieneSupplies');
    });
  }

  QueryBuilder<AwcInfra, bool, QQueryOperations> hasToiletProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasToilet');
    });
  }

  QueryBuilder<AwcInfra, bool, QQueryOperations> isBuildingSafeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBuildingSafe');
    });
  }

  QueryBuilder<AwcInfra, bool, QQueryOperations> isDirtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDirty');
    });
  }

  QueryBuilder<AwcInfra, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<AwcInfra, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<AwcInfra, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<AwcInfra, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<AwcInfra, String?, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }
}
