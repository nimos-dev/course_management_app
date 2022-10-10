// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:equatable/equatable.dart';

import '../enums/course_quiz_status.dart';
import '../models/course_quiz_question_model.dart';

class CourseQuizState extends Equatable {
  String selectedAnswer;
  List<CourseQuizQuestionModel> correct;
  List<CourseQuizQuestionModel> incorrect;
  CourseQuizStatus status;

  bool get answered => status == CourseQuizStatus.incorrect || status == CourseQuizStatus.correct;

  CourseQuizState({
    required this.selectedAnswer,
    required this.correct,
    required this.incorrect,
    required this.status,
  });

  factory CourseQuizState.initial() {
    return CourseQuizState(
      selectedAnswer: '',
      correct: [],
      incorrect: [],
      status: CourseQuizStatus.initial,
    );
  }

  @override
  List<Object> get props => [selectedAnswer, correct, incorrect, status];

  CourseQuizState copyWith({
    required String selectedAnswer,
    required List<CourseQuizQuestionModel> correct,
    required List<CourseQuizQuestionModel> incorrect,
    required CourseQuizStatus status,
  }) {
    return CourseQuizState(selectedAnswer: selectedAnswer, correct: correct, incorrect: incorrect, status: status);
  }
}
