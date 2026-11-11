// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aww_alert.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAwwAlertCollection on Isar {
  IsarCollection<AwwAlert> get awwAlerts => this.collection();
}

const AwwAlertSchema = CollectionSchema(
  name: r'AwwAlert',
  id: -2971048358374957031,
  properties: {
    r'action': PropertySchema(
      id: 0,
      name: r'action',
      type: IsarType.byte,
      enumMap: _AwwAlertactionEnumValueMap,
    ),
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
    r'expiresAt': PropertySchema(
      id: 4,
      name: r'expiresAt',
      type: IsarType.dateTime,
    ),
    r'isDirty': PropertySchema(id: 5, name: r'isDirty', type: IsarType.bool),
    r'isResolved': PropertySchema(
      id: 6,
      name: r'isResolved',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(id: 7, name: r'isSynced', type: IsarType.bool),
    r'message': PropertySchema(id: 8, name: r'message', type: IsarType.string),
    r'referralId': PropertySchema(
      id: 9,
      name: r'referralId',
      type: IsarType.long,
    ),
    r'syncedAt': PropertySchema(
      id: 10,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(id: 11, name: r'title', type: IsarType.string),
  },

  estimateSize: _awwAlertEstimateSize,
  serialize: _awwAlertSerialize,
  deserialize: _awwAlertDeserialize,
  deserializeProp: _awwAlertDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _awwAlertGetId,
  getLinks: _awwAlertGetLinks,
  attach: _awwAlertAttach,
  version: '3.3.2',
);

int _awwAlertEstimateSize(
  AwwAlert object,
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
  bytesCount += 3 + object.message.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _awwAlertSerialize(
  AwwAlert object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.action.index);
  writer.writeLong(offsets[1], object.beneficiaryId);
  writer.writeString(offsets[2], object.cloudId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDateTime(offsets[4], object.expiresAt);
  writer.writeBool(offsets[5], object.isDirty);
  writer.writeBool(offsets[6], object.isResolved);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeString(offsets[8], object.message);
  writer.writeLong(offsets[9], object.referralId);
  writer.writeDateTime(offsets[10], object.syncedAt);
  writer.writeString(offsets[11], object.title);
}

AwwAlert _awwAlertDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AwwAlert();
  object.action =
      _AwwAlertactionValueEnumMap[reader.readByteOrNull(offsets[0])] ??
      AlertAction.scheduleHomeVisit;
  object.beneficiaryId = reader.readLongOrNull(offsets[1]);
  object.cloudId = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.expiresAt = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.isDirty = reader.readBool(offsets[5]);
  object.isResolved = reader.readBool(offsets[6]);
  object.isSynced = reader.readBool(offsets[7]);
  object.message = reader.readString(offsets[8]);
  object.referralId = reader.readLongOrNull(offsets[9]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[10]);
  object.title = reader.readString(offsets[11]);
  return object;
}

P _awwAlertDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_AwwAlertactionValueEnumMap[reader.readByteOrNull(offset)] ??
              AlertAction.scheduleHomeVisit)
          as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AwwAlertactionEnumValueMap = {
  'scheduleHomeVisit': 0,
  'notifyClinic': 1,
  'none': 2,
};
const _AwwAlertactionValueEnumMap = {
  0: AlertAction.scheduleHomeVisit,
  1: AlertAction.notifyClinic,
  2: AlertAction.none,
};

Id _awwAlertGetId(AwwAlert object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _awwAlertGetLinks(AwwAlert object) {
  return [];
}

void _awwAlertAttach(IsarCollection<dynamic> col, Id id, AwwAlert object) {
  object.id = id;
}

extension AwwAlertQueryWhereSort on QueryBuilder<AwwAlert, AwwAlert, QWhere> {
  QueryBuilder<AwwAlert, AwwAlert, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AwwAlertQueryWhere on QueryBuilder<AwwAlert, AwwAlert, QWhereClause> {
  QueryBuilder<AwwAlert, AwwAlert, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterWhereClause> idBetween(
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

extension AwwAlertQueryFilter
    on QueryBuilder<AwwAlert, AwwAlert, QFilterCondition> {
  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> actionEqualTo(
    AlertAction value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'action', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> actionGreaterThan(
    AlertAction value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'action',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> actionLessThan(
    AlertAction value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'action',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> actionBetween(
    AlertAction lower,
    AlertAction upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'action',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition>
  beneficiaryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'beneficiaryId'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition>
  beneficiaryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'beneficiaryId'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> beneficiaryIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'beneficiaryId', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition>
  beneficiaryIdGreaterThan(int? value, {bool include = false}) {
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> beneficiaryIdLessThan(
    int? value, {
    bool include = false,
  }) {
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> beneficiaryIdBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdEqualTo(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdGreaterThan(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdLessThan(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdBetween(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdStartsWith(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdEndsWith(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdContains(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdMatches(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> cloudIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> expiresAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'expiresAt'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> expiresAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'expiresAt'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> expiresAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'expiresAt', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> expiresAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'expiresAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> expiresAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'expiresAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> expiresAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'expiresAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> isDirtyEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDirty', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> isResolvedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isResolved', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> isSyncedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSynced', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'message',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'message',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'message', value: ''),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'message', value: ''),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> referralIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'referralId'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition>
  referralIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'referralId'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> referralIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'referralId', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> referralIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'referralId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> referralIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'referralId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> referralIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'referralId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> syncedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> syncedAtGreaterThan(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> syncedAtLessThan(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> syncedAtBetween(
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

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }
}

extension AwwAlertQueryObject
    on QueryBuilder<AwwAlert, AwwAlert, QFilterCondition> {}

extension AwwAlertQueryLinks
    on QueryBuilder<AwwAlert, AwwAlert, QFilterCondition> {}

extension AwwAlertQuerySortBy on QueryBuilder<AwwAlert, AwwAlert, QSortBy> {
  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByIsResolved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResolved', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByIsResolvedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResolved', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByReferralId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referralId', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByReferralIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referralId', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension AwwAlertQuerySortThenBy
    on QueryBuilder<AwwAlert, AwwAlert, QSortThenBy> {
  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByIsResolved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResolved', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByIsResolvedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResolved', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByReferralId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referralId', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByReferralIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referralId', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension AwwAlertQueryWhereDistinct
    on QueryBuilder<AwwAlert, AwwAlert, QDistinct> {
  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'action');
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beneficiaryId');
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByCloudId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAt');
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDirty');
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByIsResolved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isResolved');
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByMessage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByReferralId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referralId');
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<AwwAlert, AwwAlert, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension AwwAlertQueryProperty
    on QueryBuilder<AwwAlert, AwwAlert, QQueryProperty> {
  QueryBuilder<AwwAlert, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AwwAlert, AlertAction, QQueryOperations> actionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'action');
    });
  }

  QueryBuilder<AwwAlert, int?, QQueryOperations> beneficiaryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beneficiaryId');
    });
  }

  QueryBuilder<AwwAlert, String?, QQueryOperations> cloudIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudId');
    });
  }

  QueryBuilder<AwwAlert, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AwwAlert, DateTime?, QQueryOperations> expiresAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAt');
    });
  }

  QueryBuilder<AwwAlert, bool, QQueryOperations> isDirtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDirty');
    });
  }

  QueryBuilder<AwwAlert, bool, QQueryOperations> isResolvedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isResolved');
    });
  }

  QueryBuilder<AwwAlert, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<AwwAlert, String, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<AwwAlert, int?, QQueryOperations> referralIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referralId');
    });
  }

  QueryBuilder<AwwAlert, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<AwwAlert, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
