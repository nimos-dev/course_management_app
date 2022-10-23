import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../domain/entities/results.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveQuizNewResult(int xxx) async {
    final isar = await db;

    Results? result = await isar.results.filter().idEqualTo(1000).findFirst();

    if (result != null) {
      Results? newResult = Results();

      newResult.streak = result.streak + 1;
      newResult.completedMiniQuiz = result.completedMiniQuiz + 1;
      newResult.averageScores =
          ((result.averageScores * result.completedMiniQuiz) + xxx) / (result.completedMiniQuiz + 1);

      newResult.lastMiniQuiz = DateFormat('yyyy-MM-dd').format(DateTime.now());

      isar.writeTxnSync<int>(() => isar.results.putSync(newResult));
    } else {
      Results? newResult = Results();

      newResult.streak = 1;
      newResult.completedMiniQuiz = 1;
      newResult.averageScores = xxx.toDouble();

      newResult.lastMiniQuiz = DateFormat('yyyy-MM-dd').format(DateTime.now());

      isar.writeTxnSync<int>(() => isar.results.putSync(newResult));
    }
  }

  Future<Results?> getResults() async {
    final isar = await db;

    Results? result = await isar.results.filter().idEqualTo(1000).findFirst();
    return result;
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ResultsSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
