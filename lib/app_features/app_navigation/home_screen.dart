import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../app_settings/settings_screen.dart';
import '../user_courses/courses_screen.dart';
import '../user_overview/overview_screen.dart';
import '../user_profile/profile_screen.dart';

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
        leading: const Icon(Icons.rocket_launch), // TODO: Make your own custom logo/icon
        title: const Text(
          'NanoCourse',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
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
                  context.go('/courses');
                  break;
                case 2:
                  context.go('/profile');
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
        children: const [OverviewScreen(), CoursesScreen(), ProfileScreen(), SettingsScreen()],
      ),
    );
  }
}
