// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_queue_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncQueueItemCollection on Isar {
  IsarCollection<SyncQueueItem> get syncQueueItems => this.collection();
}

const SyncQueueItemSchema = CollectionSchema(
  name: r'SyncQueueItem',
  id: 599395208720970483,
  properties: {
    r'attempts': PropertySchema(id: 0, name: r'attempts', type: IsarType.long),
    r'lastAttemptAt': PropertySchema(
      id: 1,
      name: r'lastAttemptAt',
      type: IsarType.dateTime,
    ),
    r'lastError': PropertySchema(
      id: 2,
      name: r'lastError',
      type: IsarType.string,
    ),
    r'localRecordId': PropertySchema(
      id: 3,
      name: r'localRecordId',
      type: IsarType.long,
    ),
    r'operation': PropertySchema(
      id: 4,
      name: r'operation',
      type: IsarType.byte,
      enumMap: _SyncQueueItemoperationEnumValueMap,
    ),
    r'payloadJson': PropertySchema(
      id: 5,
      name: r'payloadJson',
      type: IsarType.string,
    ),
    r'priority': PropertySchema(
      id: 6,
      name: r'priority',
      type: IsarType.byte,
      enumMap: _SyncQueueItempriorityEnumValueMap,
    ),
    r'queuedAt': PropertySchema(
      id: 7,
      name: r'queuedAt',
      type: IsarType.dateTime,
    ),
    r'target': PropertySchema(
      id: 8,
      name: r'target',
      type: IsarType.byte,
      enumMap: _SyncQueueItemtargetEnumValueMap,
    ),
  },

  estimateSize: _syncQueueItemEstimateSize,
  serialize: _syncQueueItemSerialize,
  deserialize: _syncQueueItemDeserialize,
  deserializeProp: _syncQueueItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _syncQueueItemGetId,
  getLinks: _syncQueueItemGetLinks,
  attach: _syncQueueItemAttach,
  version: '3.3.2',
);

int _syncQueueItemEstimateSize(
  SyncQueueItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.lastError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.payloadJson.length * 3;
  return bytesCount;
}

void _syncQueueItemSerialize(
  SyncQueueItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attempts);
  writer.writeDateTime(offsets[1], object.lastAttemptAt);
  writer.writeString(offsets[2], object.lastError);
  writer.writeLong(offsets[3], object.localRecordId);
  writer.writeByte(offsets[4], object.operation.index);
  writer.writeString(offsets[5], object.payloadJson);
  writer.writeByte(offsets[6], object.priority.index);
  writer.writeDateTime(offsets[7], object.queuedAt);
  writer.writeByte(offsets[8], object.target.index);
}

SyncQueueItem _syncQueueItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncQueueItem();
  object.attempts = reader.readLong(offsets[0]);
  object.id = id;
  object.lastAttemptAt = reader.readDateTimeOrNull(offsets[1]);
  object.lastError = reader.readStringOrNull(offsets[2]);
  object.localRecordId = reader.readLong(offsets[3]);
  object.operation =
      _SyncQueueItemoperationValueEnumMap[reader.readByteOrNull(offsets[4])] ??
      SyncOperation.create;
  object.payloadJson = reader.readString(offsets[5]);
  object.priority =
      _SyncQueueItempriorityValueEnumMap[reader.readByteOrNull(offsets[6])] ??
      SyncPriority.p1Critical;
  object.queuedAt = reader.readDateTime(offsets[7]);
  object.target =
      _SyncQueueItemtargetValueEnumMap[reader.readByteOrNull(offsets[8])] ??
      SyncTarget.attendance;
  return object;
}

P _syncQueueItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_SyncQueueItemoperationValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              SyncOperation.create)
          as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_SyncQueueItempriorityValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              SyncPriority.p1Critical)
          as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (_SyncQueueItemtargetValueEnumMap[reader.readByteOrNull(offset)] ??
              SyncTarget.attendance)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SyncQueueItemoperationEnumValueMap = {
  'create': 0,
  'update': 1,
  'delete': 2,
};
const _SyncQueueItemoperationValueEnumMap = {
  0: SyncOperation.create,
  1: SyncOperation.update,
  2: SyncOperation.delete,
};
const _SyncQueueItempriorityEnumValueMap = {
  'p1Critical': 0,
  'p2Important': 1,
  'p3Low': 2,
};
const _SyncQueueItempriorityValueEnumMap = {
  0: SyncPriority.p1Critical,
  1: SyncPriority.p2Important,
  2: SyncPriority.p3Low,
};
const _SyncQueueItemtargetEnumValueMap = {
  'attendance': 0,
  'thr': 1,
  'growth': 2,
  'homeVisit': 3,
  'awcInfra': 4,
  'beneficiary': 5,
};
const _SyncQueueItemtargetValueEnumMap = {
  0: SyncTarget.attendance,
  1: SyncTarget.thr,
  2: SyncTarget.growth,
  3: SyncTarget.homeVisit,
  4: SyncTarget.awcInfra,
  5: SyncTarget.beneficiary,
};

Id _syncQueueItemGetId(SyncQueueItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncQueueItemGetLinks(SyncQueueItem object) {
  return [];
}

void _syncQueueItemAttach(
  IsarCollection<dynamic> col,
  Id id,
  SyncQueueItem object,
) {
  object.id = id;
}

extension SyncQueueItemQueryWhereSort
    on QueryBuilder<SyncQueueItem, SyncQueueItem, QWhere> {
  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SyncQueueItemQueryWhere
    on QueryBuilder<SyncQueueItem, SyncQueueItem, QWhereClause> {
  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterWhereClause> idBetween(
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

extension SyncQueueItemQueryFilter
    on QueryBuilder<SyncQueueItem, SyncQueueItem, QFilterCondition> {
  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  attemptsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'attempts', value: value),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  attemptsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'attempts',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  attemptsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'attempts',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  attemptsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'attempts',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
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

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastAttemptAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastAttemptAt'),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastAttemptAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastAttemptAt'),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastAttemptAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastAttemptAt', value: value),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastAttemptAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastAttemptAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastAttemptAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastAttemptAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastAttemptAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastAttemptAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastError'),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastError'),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastError',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastError',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastError', value: ''),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  lastErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastError', value: ''),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  localRecordIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localRecordId', value: value),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  localRecordIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localRecordId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  localRecordIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localRecordId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  localRecordIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localRecordId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  operationEqualTo(SyncOperation value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'operation', value: value),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  operationGreaterThan(SyncOperation value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'operation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  operationLessThan(SyncOperation value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'operation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  operationBetween(
    SyncOperation lower,
    SyncOperation upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'operation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'payloadJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'payloadJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'payloadJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'payloadJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'payloadJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'payloadJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'payloadJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'payloadJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'payloadJson', value: ''),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  payloadJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'payloadJson', value: ''),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  priorityEqualTo(SyncPriority value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'priority', value: value),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  priorityGreaterThan(SyncPriority value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'priority',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  priorityLessThan(SyncPriority value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'priority',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  priorityBetween(
    SyncPriority lower,
    SyncPriority upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'priority',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  queuedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'queuedAt', value: value),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  queuedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'queuedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  queuedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'queuedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  queuedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'queuedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  targetEqualTo(SyncTarget value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'target', value: value),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  targetGreaterThan(SyncTarget value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'target',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  targetLessThan(SyncTarget value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'target',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterFilterCondition>
  targetBetween(
    SyncTarget lower,
    SyncTarget upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'target',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SyncQueueItemQueryObject
    on QueryBuilder<SyncQueueItem, SyncQueueItem, QFilterCondition> {}

extension SyncQueueItemQueryLinks
    on QueryBuilder<SyncQueueItem, SyncQueueItem, QFilterCondition> {}

extension SyncQueueItemQuerySortBy
    on QueryBuilder<SyncQueueItem, SyncQueueItem, QSortBy> {
  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> sortByAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attempts', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByAttemptsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attempts', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> sortByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByLocalRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localRecordId', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByLocalRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localRecordId', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> sortByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> sortByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> sortByQueuedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queuedAt', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  sortByQueuedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queuedAt', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> sortByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> sortByTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.desc);
    });
  }
}

extension SyncQueueItemQuerySortThenBy
    on QueryBuilder<SyncQueueItem, SyncQueueItem, QSortThenBy> {
  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenByAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attempts', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByAttemptsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attempts', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByLocalRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localRecordId', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByLocalRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localRecordId', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenByQueuedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queuedAt', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy>
  thenByQueuedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queuedAt', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QAfterSortBy> thenByTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.desc);
    });
  }
}

extension SyncQueueItemQueryWhereDistinct
    on QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct> {
  QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct> distinctByAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attempts');
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct>
  distinctByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAttemptAt');
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct> distinctByLastError({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct>
  distinctByLocalRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localRecordId');
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct> distinctByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operation');
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct> distinctByPayloadJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payloadJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct> distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct> distinctByQueuedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'queuedAt');
    });
  }

  QueryBuilder<SyncQueueItem, SyncQueueItem, QDistinct> distinctByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'target');
    });
  }
}

extension SyncQueueItemQueryProperty
    on QueryBuilder<SyncQueueItem, SyncQueueItem, QQueryProperty> {
  QueryBuilder<SyncQueueItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncQueueItem, int, QQueryOperations> attemptsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attempts');
    });
  }

  QueryBuilder<SyncQueueItem, DateTime?, QQueryOperations>
  lastAttemptAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAttemptAt');
    });
  }

  QueryBuilder<SyncQueueItem, String?, QQueryOperations> lastErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastError');
    });
  }

  QueryBuilder<SyncQueueItem, int, QQueryOperations> localRecordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localRecordId');
    });
  }

  QueryBuilder<SyncQueueItem, SyncOperation, QQueryOperations>
  operationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operation');
    });
  }

  QueryBuilder<SyncQueueItem, String, QQueryOperations> payloadJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payloadJson');
    });
  }

  QueryBuilder<SyncQueueItem, SyncPriority, QQueryOperations>
  priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<SyncQueueItem, DateTime, QQueryOperations> queuedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'queuedAt');
    });
  }

  QueryBuilder<SyncQueueItem, SyncTarget, QQueryOperations> targetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'target');
    });
  }
}
