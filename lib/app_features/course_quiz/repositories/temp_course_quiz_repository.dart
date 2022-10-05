// course_quiz_repository.dart

// TODO: NOTE Test only: Replace with firebase quiz for each course...

import 'package:dio/dio.dart';
import 'dart:io';

import '../constants/language_constants.dart';
import '../models/course_quiz_failure_model.dart';
import '../models/course_quiz_question_model.dart';
import 'course_quiz_repository_interface.dart';

class TempQuizRepository extends CourseQuizRepositoryInterface {
  TempQuizRepository();

  @override
  Future<List<CourseQuizQuestionModel>> getQuestions() async {
    try {
      final response = await Dio().get('https://opentdb.com/api.php?amount=10&category=18&type=multiple');

      if (response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data);
        final results = List<Map<String, dynamic>>.from(data['results'] ?? []);
        if (results.isNotEmpty) {
          return results.map((e) => CourseQuizQuestionModel.fromMap(e)).toList();
        }
      }
      return [];
    } on DioError catch (_) {
      throw CourseQuizFailureModel(
        message: _.response?.statusMessage ?? errorMessage,
      );
    } on SocketException catch (_) {
      throw const CourseQuizFailureModel(message: errorCheckInternetConnection);
    }
  }
}
