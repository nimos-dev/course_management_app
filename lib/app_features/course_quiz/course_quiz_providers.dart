import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/course_quiz_controller.dart';
import 'controller/course_quiz_state.dart';
import 'models/course_quiz_question_model.dart';
import 'repositories/temp_course_quiz_repository.dart';

final quizRepositoryProvider = Provider<TempQuizRepository>(
  (ref) => TempQuizRepository(),
);

final quizControllerProvider = StateNotifierProvider.autoDispose<CourseQuizController, CourseQuizState>(
  (ref) => CourseQuizController(),
);

final quizQuestionsProvider = FutureProvider.autoDispose<List<CourseQuizQuestionModel>>(
  (ref) => ref.watch(quizRepositoryProvider).getQuestions(),
);

final animatedOpacityBoolProvider = StateProvider<bool>(
  (ref) => true,
);
