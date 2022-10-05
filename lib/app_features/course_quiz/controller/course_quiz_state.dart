import 'package:equatable/equatable.dart';

import '../enums/course_quiz_status.dart';
import '../models/course_quiz_question_model.dart';

class CourseQuizState extends Equatable {
  final String selectedAnswer;
  final List<CourseQuizQuestionModel> correct;
  final List<CourseQuizQuestionModel> incorrect;
  final CourseQuizStatus status;

  bool get answered => status == CourseQuizStatus.incorrect || status == CourseQuizStatus.correct;

  const CourseQuizState({
    required this.selectedAnswer,
    required this.correct,
    required this.incorrect,
    required this.status,
  });

  factory CourseQuizState.initial() {
    // ignore: prefer_const_constructors
    return CourseQuizState(
      selectedAnswer: '',
      // ignore: prefer_const_literals_to_create_immutables
      correct: [],
      // ignore: prefer_const_literals_to_create_immutables
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
