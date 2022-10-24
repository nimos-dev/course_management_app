import 'package:uuid/uuid.dart';

// TODO: Convert level to Enum: Beginner | Intermidiate | Advanced
// TODO: Calculate base of level

const uuid = Uuid();

class CourseInfoModel {
  String id;
  String title;
  String description;
  String level;
  double indicatorValue;

  CourseInfoModel({
    required this.title,
    required this.description,
    required this.level,
    required this.indicatorValue,
  }) : id = uuid.v4(); // TODO: Get ID from Firestore Document...
}

// Temp data...

List<CourseInfoModel> myCourses = [
  CourseInfoModel(
    title: 'Computer science quiz (Easy)',
    description: 'Test...',
    level: 'Advanced',
    indicatorValue: 0.33,
  ),
  CourseInfoModel(
    title: 'Computer science quiz (Normal)',
    description: 'Test...',
    level: 'Beginner',
    indicatorValue: 0.66,
  ),
  CourseInfoModel(
    title: 'Computer science quiz (Advanced)',
    description: 'Test...',
    level: 'Beginner',
    indicatorValue: 1.00,
  ),
];
