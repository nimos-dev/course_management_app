// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';

import 'package:school_soft_project/app_features/course_quiz/controller/course_quiz_controller.dart';
import 'package:school_soft_project/app_features/course_quiz/enums/course_quiz_status.dart';

void main() {
  late CourseQuizController systemUnderTest;

  setUp(
    () {
      systemUnderTest = CourseQuizController();
    },
  );

  test(
    'Initial state are correct',
    () {
      expect(systemUnderTest.state.selectedAnswer, '');
      expect(systemUnderTest.state.correct, []);
      expect(systemUnderTest.state.incorrect, []);
      expect(systemUnderTest.state.status, CourseQuizStatus.initial);
    },
  );
}
