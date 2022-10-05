import '../models/course_quiz_question_model.dart';

abstract class CourseQuizRepositoryInterface {
  Future<List<CourseQuizQuestionModel>> getQuestions();
}
