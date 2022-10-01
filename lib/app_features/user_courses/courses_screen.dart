import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../app_config/constants.dart';
import 'course_info_model.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final items = List<String>.generate(10, (i) => 'Course $i');
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: myCourses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myCourses[index].title),
            onTap: () {
              // final course = myCourses[index];
              context.goNamed(coursesDetailsRouteName, params: {'course': myCourses[index].id});
            },
          );
        },
      ),
    );
  }
}
