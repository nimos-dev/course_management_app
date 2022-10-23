// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetResultsCollection on Isar {
  IsarCollection<Results> get results => this.collection();
}

const ResultsSchema = CollectionSchema(
  name: r'Results',
  id: -1436908029528008098,
  properties: {
    r'averageScores': PropertySchema(
      id: 0,
      name: r'averageScores',
      type: IsarType.long,
    ),
    r'completedMiniQuiz': PropertySchema(
      id: 1,
      name: r'completedMiniQuiz',
      type: IsarType.long,
    ),
    r'lastMiniQuiz': PropertySchema(
      id: 2,
      name: r'lastMiniQuiz',
      type: IsarType.string,
    ),
    r'streak': PropertySchema(
      id: 3,
      name: r'streak',
      type: IsarType.long,
    )
  },
  estimateSize: _resultsEstimateSize,
  serialize: _resultsSerialize,
  deserialize: _resultsDeserialize,
  deserializeProp: _resultsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _resultsGetId,
  getLinks: _resultsGetLinks,
  attach: _resultsAttach,
  version: '3.0.2',
);

int _resultsEstimateSize(
  Results object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lastMiniQuiz.length * 3;
  return bytesCount;
}

void _resultsSerialize(
  Results object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.averageScores);
  writer.writeLong(offsets[1], object.completedMiniQuiz);
  writer.writeString(offsets[2], object.lastMiniQuiz);
  writer.writeLong(offsets[3], object.streak);
}

Results _resultsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Results();
  object.averageScores = reader.readLong(offsets[0]);
  object.completedMiniQuiz = reader.readLong(offsets[1]);
  object.id = id;
  object.lastMiniQuiz = reader.readString(offsets[2]);
  object.streak = reader.readLong(offsets[3]);
  return object;
}

P _resultsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _resultsGetId(Results object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _resultsGetLinks(Results object) {
  return [];
}

void _resultsAttach(IsarCollection<dynamic> col, Id id, Results object) {
  object.id = id;
}

extension ResultsQueryWhereSort on QueryBuilder<Results, Results, QWhere> {
  QueryBuilder<Results, Results, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ResultsQueryWhere on QueryBuilder<Results, Results, QWhereClause> {
  QueryBuilder<Results, Results, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Results, Results, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Results, Results, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Results, Results, QAfterWhereClause> idBetween(
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

extension ResultsQueryFilter
    on QueryBuilder<Results, Results, QFilterCondition> {
  QueryBuilder<Results, Results, QAfterFilterCondition> averageScoresEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageScores',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      averageScoresGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageScores',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> averageScoresLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageScores',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> averageScoresBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageScores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      completedMiniQuizEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedMiniQuiz',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      completedMiniQuizGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedMiniQuiz',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      completedMiniQuizLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedMiniQuiz',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      completedMiniQuizBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedMiniQuiz',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<Results, Results, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<Results, Results, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<Results, Results, QAfterFilterCondition> lastMiniQuizEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMiniQuiz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> lastMiniQuizGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastMiniQuiz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> lastMiniQuizLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastMiniQuiz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> lastMiniQuizBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastMiniQuiz',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> lastMiniQuizStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastMiniQuiz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> lastMiniQuizEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastMiniQuiz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> lastMiniQuizContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastMiniQuiz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> lastMiniQuizMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastMiniQuiz',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> lastMiniQuizIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMiniQuiz',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      lastMiniQuizIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastMiniQuiz',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> streakEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> streakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> streakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> streakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ResultsQueryObject
    on QueryBuilder<Results, Results, QFilterCondition> {}

extension ResultsQueryLinks
    on QueryBuilder<Results, Results, QFilterCondition> {}

extension ResultsQuerySortBy on QueryBuilder<Results, Results, QSortBy> {
  QueryBuilder<Results, Results, QAfterSortBy> sortByAverageScores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageScores', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByAverageScoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageScores', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByCompletedMiniQuiz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedMiniQuiz', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByCompletedMiniQuizDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedMiniQuiz', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByLastMiniQuiz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMiniQuiz', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByLastMiniQuizDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMiniQuiz', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.desc);
    });
  }
}

extension ResultsQuerySortThenBy
    on QueryBuilder<Results, Results, QSortThenBy> {
  QueryBuilder<Results, Results, QAfterSortBy> thenByAverageScores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageScores', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByAverageScoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageScores', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByCompletedMiniQuiz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedMiniQuiz', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByCompletedMiniQuizDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedMiniQuiz', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByLastMiniQuiz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMiniQuiz', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByLastMiniQuizDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMiniQuiz', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.desc);
    });
  }
}

extension ResultsQueryWhereDistinct
    on QueryBuilder<Results, Results, QDistinct> {
  QueryBuilder<Results, Results, QDistinct> distinctByAverageScores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageScores');
    });
  }

  QueryBuilder<Results, Results, QDistinct> distinctByCompletedMiniQuiz() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedMiniQuiz');
    });
  }

  QueryBuilder<Results, Results, QDistinct> distinctByLastMiniQuiz(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastMiniQuiz', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Results, Results, QDistinct> distinctByStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streak');
    });
  }
}

extension ResultsQueryProperty
    on QueryBuilder<Results, Results, QQueryProperty> {
  QueryBuilder<Results, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Results, int, QQueryOperations> averageScoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageScores');
    });
  }

  QueryBuilder<Results, int, QQueryOperations> completedMiniQuizProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedMiniQuiz');
    });
  }

  QueryBuilder<Results, String, QQueryOperations> lastMiniQuizProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastMiniQuiz');
    });
  }

  QueryBuilder<Results, int, QQueryOperations> streakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streak');
    });
  }
}
