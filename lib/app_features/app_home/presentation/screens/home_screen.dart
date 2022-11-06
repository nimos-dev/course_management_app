import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:school_soft_project/extensions/string_extension.dart';

import '../../../app_settings/presentation/screens/settings_screen.dart';
import '../../../course_quiz/presentation/screens/course_quiz_screen.dart';
import '../../app_home_features/user_courses/presentation/screens/courses_screen.dart';
import '../../app_home_features/user_overview/presentation/screens/overview_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final int index;

  HomeScreen({required String tab, Key? key})
      : index = indexFrom(tab),
        super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();

  static int indexFrom(String tab) {
    switch (tab) {
      case 'overview':
        return 0;
      case 'courses':
        return 1;
      case 'profile':
        return 2;
      case 'settings':
        return 3;
      default:
        return 0;
    }
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.rocket_launch),
        title: const Text(
          'NanoQuiz',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context).overview.capitalize(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.quiz),
            label: AppLocalizations.of(context).mini_quiz.capitalize(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: AppLocalizations.of(context).practice.capitalize(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context).settings.capitalize(),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
              switch (index) {
                case 0:
                  context.go('/overview');
                  break;
                case 1:
                  context.go('/profile');
                  break;
                case 2:
                  context.go('/courses');
                  break;
                case 3:
                  context.go('/settings');
                  break;
              }
            },
          );
        },
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [OverviewScreen(), CourseQuizScreen(), CoursesScreen(), SettingsScreen()], //  ProfileScreen
      ),
    );
  }
}
