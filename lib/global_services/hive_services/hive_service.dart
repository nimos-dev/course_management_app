import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class HiveService extends ChangeNotifier {
  //
  final _mybox = Hive.box('nano_quiz');

  HiveService();

  void setAvatarLink(String string) {
    _mybox.put('my_avatar_link', string);
    notifyListeners();
  }

  String getAvatarLink() {
    if (_mybox.containsKey('my_avatar_link')) {
      return _mybox.get('my_avatar_link');
    } else {
      return '';
    }
  }

  // TODO: Implement custom box class fore data...

  // create or uppdate datavalue

  void writeTestData() {
    //
    int randomScore = Random().nextInt(11);

    // number_of_mini_quiz
    if (_mybox.containsKey('number_of_mini_quiz')) {
      _mybox.put('number_of_mini_quiz', (_mybox.get('number_of_mini_quiz') + 1));
      notifyListeners();
    } else {
      _mybox.put('number_of_mini_quiz', 1);
      notifyListeners();
    }
    // ----->

    // mini_quiz_average_scores
    if (_mybox.containsKey('mini_quiz_average_scores')) {
      double oldAverageScores = _mybox.get('mini_quiz_average_scores');
      int numberOf = _mybox.get('number_of_mini_quiz');
      double newAverageScores = ((oldAverageScores * (numberOf - 1)) + randomScore) / numberOf;

      _mybox.put('mini_quiz_average_scores', newAverageScores);
      notifyListeners();
    } else {
      _mybox.put('mini_quiz_average_scores', randomScore.toDouble());
      notifyListeners();
    }
    // ----->
  }

  // read datavalues

  int readTestDataNumberof() {
    if (_mybox.containsKey('number_of_mini_quiz')) {
      return _mybox.get('number_of_mini_quiz');
    } else {
      return 0;
    }
  }

  double readTestDataAverageScore() {
    if (_mybox.containsKey('mini_quiz_average_scores')) {
      return _mybox.get('mini_quiz_average_scores');
    } else {
      return 0.0;
    }
  }

  // delete datavalue

  deleteTestData() {
    _mybox.delete('number_of_mini_quiz');
    _mybox.delete('mini_quiz_average_scores');
    notifyListeners();
  }
}

final hiveServiceProvider = ChangeNotifierProvider<HiveService>((ref) => HiveService());
