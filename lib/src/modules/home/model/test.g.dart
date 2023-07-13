// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTest1Collection on Isar {
  IsarCollection<Test1> get test1s => this.collection();
}

const Test1Schema = CollectionSchema(
  name: r'Test1',
  id: 4794957019204198018,
  properties: {
    r'v1': PropertySchema(
      id: 0,
      name: r'v1',
      type: IsarType.string,
    )
  },
  estimateSize: _test1EstimateSize,
  serialize: _test1Serialize,
  deserialize: _test1Deserialize,
  deserializeProp: _test1DeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _test1GetId,
  getLinks: _test1GetLinks,
  attach: _test1Attach,
  version: '3.0.5',
);

int _test1EstimateSize(
  Test1 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.v1.length * 3;
  return bytesCount;
}

void _test1Serialize(
  Test1 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.v1);
}

Test1 _test1Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Test1(
    v1: reader.readString(offsets[0]),
  );
  object.id = id;
  return object;
}

P _test1DeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _test1GetId(Test1 object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _test1GetLinks(Test1 object) {
  return [];
}

void _test1Attach(IsarCollection<dynamic> col, Id id, Test1 object) {
  object.id = id;
}

extension Test1QueryWhereSort on QueryBuilder<Test1, Test1, QWhere> {
  QueryBuilder<Test1, Test1, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension Test1QueryWhere on QueryBuilder<Test1, Test1, QWhereClause> {
  QueryBuilder<Test1, Test1, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Test1, Test1, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Test1, Test1, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Test1, Test1, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension Test1QueryFilter on QueryBuilder<Test1, Test1, QFilterCondition> {
  QueryBuilder<Test1, Test1, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'v1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'v1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'v1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'v1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'v1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'v1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1Contains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'v1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1Matches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'v1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'v1',
        value: '',
      ));
    });
  }

  QueryBuilder<Test1, Test1, QAfterFilterCondition> v1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'v1',
        value: '',
      ));
    });
  }
}

extension Test1QueryObject on QueryBuilder<Test1, Test1, QFilterCondition> {}

extension Test1QueryLinks on QueryBuilder<Test1, Test1, QFilterCondition> {}

extension Test1QuerySortBy on QueryBuilder<Test1, Test1, QSortBy> {
  QueryBuilder<Test1, Test1, QAfterSortBy> sortByV1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v1', Sort.asc);
    });
  }

  QueryBuilder<Test1, Test1, QAfterSortBy> sortByV1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v1', Sort.desc);
    });
  }
}

extension Test1QuerySortThenBy on QueryBuilder<Test1, Test1, QSortThenBy> {
  QueryBuilder<Test1, Test1, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Test1, Test1, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Test1, Test1, QAfterSortBy> thenByV1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v1', Sort.asc);
    });
  }

  QueryBuilder<Test1, Test1, QAfterSortBy> thenByV1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v1', Sort.desc);
    });
  }
}

extension Test1QueryWhereDistinct on QueryBuilder<Test1, Test1, QDistinct> {
  QueryBuilder<Test1, Test1, QDistinct> distinctByV1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'v1', caseSensitive: caseSensitive);
    });
  }
}

extension Test1QueryProperty on QueryBuilder<Test1, Test1, QQueryProperty> {
  QueryBuilder<Test1, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Test1, String, QQueryOperations> v1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'v1');
    });
  }
}
