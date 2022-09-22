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
    title: 'GDPR for app developers',
    description: 'The course deals with basic laws and regulations that apply as a result of GDPR\'s introduction',
    level: 'Advanced',
    indicatorValue: 1.0,
  ),
  CourseInfoModel(
    title: 'Cooking in 15 minutes',
    description: 'The course teach you to cook ten nutritious and tasty meals in under 15 minutes',
    level: 'Beginner',
    indicatorValue: 0.33,
  ),
  CourseInfoModel(
    title: 'Vegetable growing (Basic)',
    description: 'Learn the basics of successful small-scale vegetable farming in an urban environment',
    level: 'Beginner',
    indicatorValue: 0.33,
  ),
  CourseInfoModel(
    title: 'Vegetable growing (Advanced)',
    description: 'Learn the basics of microgreen cultivation in an urban environment',
    level: 'Intermidiate',
    indicatorValue: 0.66,
  ),
  CourseInfoModel(
    title: 'Vegetable growing (Expert)',
    description: 'Market gardening in an urban environment',
    level: 'Advanced',
    indicatorValue: 1.0,
  ),
];
