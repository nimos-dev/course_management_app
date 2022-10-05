import 'package:equatable/equatable.dart';

class CourseQuizFailureModel extends Equatable {
  final String message;

  const CourseQuizFailureModel({this.message = ''});

  @override
  List<Object> get props => [message];
}
