import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/course_quiz_status.dart';
import '../models/course_quiz_question_model.dart';

import 'course_quiz_state.dart';

class CourseQuizController extends StateNotifier<CourseQuizState> {
  //
  CourseQuizController() : super(CourseQuizState.initial());

  void submitAnswer(CourseQuizQuestionModel currentQuestion, String answer) {
    if (state.answered) return;
    if (currentQuestion.correctAnswer == answer) {
      state = state.copyWith(
        selectedAnswer: answer,
        correct: (state.correct)..add(currentQuestion),
        incorrect: state.incorrect,
        status: CourseQuizStatus.correct,
      );
    } else {
      state = state.copyWith(
        selectedAnswer: answer,
        correct: state.correct,
        incorrect: (state.incorrect)..add(currentQuestion),
        status: CourseQuizStatus.incorrect,
      );
    }
  }

  void nextQuestion(List<CourseQuizQuestionModel> questions, int currentIndex) {
    state = state.copyWith(
      selectedAnswer: '',
      correct: state.correct,
      incorrect: state.incorrect,
      status: currentIndex + 1 < questions.length ? CourseQuizStatus.initial : CourseQuizStatus.complete,
    );
  }

  void reset() => state = CourseQuizState.initial();
}
