import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:school_soft_project/app_features/app_authentication/app_authentication_providers.dart';

class HiveService extends ChangeNotifier {
  //
  final _mybox = Hive.box('nano_quiz');
  final Ref ref;

  HiveService({required this.ref});

  void setUserName(String string) {
    _mybox.put('${ref.read(authRepositoryProvider).getUserID()}_UserName', string);
    notifyListeners();
  }

  String getUserName() {
    if (_mybox.containsKey('${ref.read(authRepositoryProvider).getUserID()}_UserName')) {
      return _mybox.get('${ref.read(authRepositoryProvider).getUserID()}_UserName');
    } else {
      return 'Anonymous';
    }
  }

  void setAvatarLink(String string) {
    _mybox.put('${ref.read(authRepositoryProvider).getUserID()}_my_avatar_link', string);
    notifyListeners();
  }

  String getAvatarLink() {
    if (_mybox.containsKey('${ref.read(authRepositoryProvider).getUserID()}_my_avatar_link')) {
      return _mybox.get('${ref.read(authRepositoryProvider).getUserID()}_my_avatar_link');
    } else {
      return '';
    }
  }

  // TODO: Implement custom box class fore data...

  // create or uppdate datavalue

  void addTestData(int score) {
    print(ref.read(authRepositoryProvider).getUserID());

    final String uID = ref.read(authRepositoryProvider).getUserID() ?? '';
    //
    if (_mybox.containsKey('${uID}_number_of_mini_quiz')) {
      _mybox.put('${uID}_number_of_mini_quiz', (_mybox.get('${uID}_number_of_mini_quiz') + 1));
      notifyListeners();
    } else {
      _mybox.put('${uID}_number_of_mini_quiz', 1);
      notifyListeners();
    }
    // ----->

    // mini_quiz_average_scores
    if (_mybox.containsKey('${uID}_mini_quiz_average_scores')) {
      double oldAverageScores = _mybox.get('${uID}_mini_quiz_average_scores');
      int numberOf = _mybox.get('${uID}_number_of_mini_quiz');
      double newAverageScores = ((oldAverageScores * (numberOf - 1)) + score) / numberOf;

      _mybox.put('${uID}_mini_quiz_average_scores', newAverageScores);
      notifyListeners();
    } else {
      _mybox.put('${uID}_mini_quiz_average_scores', score.toDouble());
      notifyListeners();
    }
    // ----->
  }

  // read datavalues

  int readTestDataNumberof() {
    if (_mybox.containsKey('${ref.read(authRepositoryProvider).getUserID()}_number_of_mini_quiz')) {
      return _mybox.get('${ref.read(authRepositoryProvider).getUserID()}_number_of_mini_quiz');
    } else {
      return 0;
    }
  }

  double readTestDataAverageScore() {
    if (_mybox.containsKey('${ref.read(authRepositoryProvider).getUserID()}_mini_quiz_average_scores')) {
      return _mybox.get('${ref.read(authRepositoryProvider).getUserID()}_mini_quiz_average_scores');
    } else {
      return 0.0;
    }
  }

  // delete datavalue

  deleteTestData() {
    _mybox.delete('${ref.read(authRepositoryProvider).getUserID()}_number_of_mini_quiz');
    _mybox.delete('${ref.read(authRepositoryProvider).getUserID()}_mini_quiz_average_scores');
    notifyListeners();
  }
}

final hiveServiceProvider = ChangeNotifierProvider<HiveService>((ref) => HiveService(ref: ref));
