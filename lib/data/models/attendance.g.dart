// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAttendanceCollection on Isar {
  IsarCollection<Attendance> get attendances => this.collection();
}

const AttendanceSchema = CollectionSchema(
  name: r'Attendance',
  id: 4618409064190326501,
  properties: {
    r'beneficiaryId': PropertySchema(
      id: 0,
      name: r'beneficiaryId',
      type: IsarType.long,
    ),
    r'cloudId': PropertySchema(id: 1, name: r'cloudId', type: IsarType.string),
    r'isDirty': PropertySchema(id: 2, name: r'isDirty', type: IsarType.bool),
    r'isSynced': PropertySchema(id: 3, name: r'isSynced', type: IsarType.bool),
    r'kind': PropertySchema(
      id: 4,
      name: r'kind',
      type: IsarType.byte,
      enumMap: _AttendancekindEnumValueMap,
    ),
    r'markedAt': PropertySchema(
      id: 5,
      name: r'markedAt',
      type: IsarType.dateTime,
    ),
    r'markedByWorkerId': PropertySchema(
      id: 6,
      name: r'markedByWorkerId',
      type: IsarType.string,
    ),
    r'otpRef': PropertySchema(id: 7, name: r'otpRef', type: IsarType.string),
    r'syncedAt': PropertySchema(
      id: 8,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'verification': PropertySchema(
      id: 9,
      name: r'verification',
      type: IsarType.byte,
      enumMap: _AttendanceverificationEnumValueMap,
    ),
  },

  estimateSize: _attendanceEstimateSize,
  serialize: _attendanceSerialize,
  deserialize: _attendanceDeserialize,
  deserializeProp: _attendanceDeserializeProp,
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

  getId: _attendanceGetId,
  getLinks: _attendanceGetLinks,
  attach: _attendanceAttach,
  version: '3.3.2',
);

int _attendanceEstimateSize(
  Attendance object,
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
    final value = object.markedByWorkerId;
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
  return bytesCount;
}

void _attendanceSerialize(
  Attendance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.beneficiaryId);
  writer.writeString(offsets[1], object.cloudId);
  writer.writeBool(offsets[2], object.isDirty);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeByte(offsets[4], object.kind.index);
  writer.writeDateTime(offsets[5], object.markedAt);
  writer.writeString(offsets[6], object.markedByWorkerId);
  writer.writeString(offsets[7], object.otpRef);
  writer.writeDateTime(offsets[8], object.syncedAt);
  writer.writeByte(offsets[9], object.verification.index);
}

Attendance _attendanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Attendance();
  object.beneficiaryId = reader.readLong(offsets[0]);
  object.cloudId = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.isDirty = reader.readBool(offsets[2]);
  object.isSynced = reader.readBool(offsets[3]);
  object.kind =
      _AttendancekindValueEnumMap[reader.readByteOrNull(offsets[4])] ??
      AttendanceKind.pse;
  object.markedAt = reader.readDateTime(offsets[5]);
  object.markedByWorkerId = reader.readStringOrNull(offsets[6]);
  object.otpRef = reader.readStringOrNull(offsets[7]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[8]);
  object.verification =
      _AttendanceverificationValueEnumMap[reader.readByteOrNull(offsets[9])] ??
      VerificationMethod.qr;
  return object;
}

P _attendanceDeserializeProp<P>(
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
      return (_AttendancekindValueEnumMap[reader.readByteOrNull(offset)] ??
              AttendanceKind.pse)
          as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (_AttendanceverificationValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              VerificationMethod.qr)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AttendancekindEnumValueMap = {'pse': 0, 'hcm': 1, 'snack': 2};
const _AttendancekindValueEnumMap = {
  0: AttendanceKind.pse,
  1: AttendanceKind.hcm,
  2: AttendanceKind.snack,
};
const _AttendanceverificationEnumValueMap = {'qr': 0, 'otp': 1, 'manual': 2};
const _AttendanceverificationValueEnumMap = {
  0: VerificationMethod.qr,
  1: VerificationMethod.otp,
  2: VerificationMethod.manual,
};

Id _attendanceGetId(Attendance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _attendanceGetLinks(Attendance object) {
  return [];
}

void _attendanceAttach(IsarCollection<dynamic> col, Id id, Attendance object) {
  object.id = id;
}

extension AttendanceQueryWhereSort
    on QueryBuilder<Attendance, Attendance, QWhere> {
  QueryBuilder<Attendance, Attendance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterWhere> anyBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'beneficiaryId'),
      );
    });
  }
}

extension AttendanceQueryWhere
    on QueryBuilder<Attendance, Attendance, QWhereClause> {
  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> beneficiaryIdEqualTo(
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

  QueryBuilder<Attendance, Attendance, QAfterWhereClause>
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

  QueryBuilder<Attendance, Attendance, QAfterWhereClause>
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

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> beneficiaryIdLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> beneficiaryIdBetween(
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

extension AttendanceQueryFilter
    on QueryBuilder<Attendance, Attendance, QFilterCondition> {
  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  beneficiaryIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'beneficiaryId', value: value),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> cloudIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  cloudIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cloudId'),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> cloudIdEqualTo(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> cloudIdLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> cloudIdBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> cloudIdStartsWith(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> cloudIdEndsWith(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> cloudIdContains(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> cloudIdMatches(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> cloudIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  cloudIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cloudId', value: ''),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> isDirtyEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDirty', value: value),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> isSyncedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSynced', value: value),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> kindEqualTo(
    AttendanceKind value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'kind', value: value),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> kindGreaterThan(
    AttendanceKind value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'kind',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> kindLessThan(
    AttendanceKind value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'kind',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> kindBetween(
    AttendanceKind lower,
    AttendanceKind upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'kind',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> markedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'markedAt', value: value),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'markedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> markedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'markedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> markedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'markedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'markedByWorkerId'),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'markedByWorkerId'),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'markedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'markedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'markedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'markedByWorkerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'markedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'markedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'markedByWorkerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'markedByWorkerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'markedByWorkerId', value: ''),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  markedByWorkerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'markedByWorkerId', value: ''),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'otpRef'),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  otpRefIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'otpRef'),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefGreaterThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> otpRefIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'otpRef', value: ''),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  otpRefIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'otpRef', value: ''),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> syncedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> syncedAtLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> syncedAtBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
  verificationEqualTo(VerificationMethod value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'verification', value: value),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

extension AttendanceQueryObject
    on QueryBuilder<Attendance, Attendance, QFilterCondition> {}

extension AttendanceQueryLinks
    on QueryBuilder<Attendance, Attendance, QFilterCondition> {}

extension AttendanceQuerySortBy
    on QueryBuilder<Attendance, Attendance, QSortBy> {
  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByMarkedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByMarkedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByMarkedByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedByWorkerId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
  sortByMarkedByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedByWorkerId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByOtpRef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otpRef', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByOtpRefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otpRef', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByVerification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verification', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByVerificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verification', Sort.desc);
    });
  }
}

extension AttendanceQuerySortThenBy
    on QueryBuilder<Attendance, Attendance, QSortThenBy> {
  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByBeneficiaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByIsDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirty', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByMarkedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByMarkedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByMarkedByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedByWorkerId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
  thenByMarkedByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedByWorkerId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByOtpRef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otpRef', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByOtpRefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otpRef', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByVerification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verification', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByVerificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verification', Sort.desc);
    });
  }
}

extension AttendanceQueryWhereDistinct
    on QueryBuilder<Attendance, Attendance, QDistinct> {
  QueryBuilder<Attendance, Attendance, QDistinct> distinctByBeneficiaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beneficiaryId');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByCloudId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByIsDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDirty');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kind');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByMarkedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'markedAt');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByMarkedByWorkerId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'markedByWorkerId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByOtpRef({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otpRef', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByVerification() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verification');
    });
  }
}

extension AttendanceQueryProperty
    on QueryBuilder<Attendance, Attendance, QQueryProperty> {
  QueryBuilder<Attendance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Attendance, int, QQueryOperations> beneficiaryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beneficiaryId');
    });
  }

  QueryBuilder<Attendance, String?, QQueryOperations> cloudIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudId');
    });
  }

  QueryBuilder<Attendance, bool, QQueryOperations> isDirtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDirty');
    });
  }

  QueryBuilder<Attendance, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<Attendance, AttendanceKind, QQueryOperations> kindProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kind');
    });
  }

  QueryBuilder<Attendance, DateTime, QQueryOperations> markedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'markedAt');
    });
  }

  QueryBuilder<Attendance, String?, QQueryOperations>
  markedByWorkerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'markedByWorkerId');
    });
  }

  QueryBuilder<Attendance, String?, QQueryOperations> otpRefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otpRef');
    });
  }

  QueryBuilder<Attendance, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<Attendance, VerificationMethod, QQueryOperations>
  verificationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verification');
    });
  }
}
