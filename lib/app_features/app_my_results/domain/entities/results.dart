import 'package:isar/isar.dart';

part 'results.g.dart';

@Collection()
class Results {
  Id id = 1000;
  late int completedMiniQuiz;
  late double averageScores;
  late String lastMiniQuiz;
  late int streak;
}
