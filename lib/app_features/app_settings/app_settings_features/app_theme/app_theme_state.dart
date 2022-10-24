import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

// TODO: Use Enum DarkModeHighContrast | DarkModeLowContrast | BrightModeHighContrast | BrightModeLowContrast

String darkModeKey = 'darkModeKey'; // TODO: USE Firestore ID + darkModeKey
String highContrastKey = 'highContrastKey'; // TODO: USE Firestore ID + highContrastKey

class AppThemeState extends ChangeNotifier {
  AppThemeState({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  bool? isDarkModeEnabled;
  bool? isHighContrastEnabled;

  void setLightTheme() {
    sharedPreferences.setBool(darkModeKey, false);
    isDarkModeEnabled = false;
    notifyListeners();
  }

  void setDarkTheme() {
    sharedPreferences.setBool(darkModeKey, true);
    isDarkModeEnabled = true;
    notifyListeners();
  }

  void setHighContrastOff() {
    sharedPreferences.setBool(highContrastKey, false);
    isHighContrastEnabled = false;
    notifyListeners();
  }

  void setHighContrastOn() {
    sharedPreferences.setBool(highContrastKey, true);
    isHighContrastEnabled = true;
    notifyListeners();
  }

  Future<void> loadAppThemeStateOnAppStart() async {
    isDarkModeEnabled = sharedPreferences.getBool(darkModeKey) ?? true;
    isHighContrastEnabled = sharedPreferences.getBool(highContrastKey) ?? false;
    await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
  }
}

final appThemeStateNotifier =
    ChangeNotifierProvider((ref) => AppThemeState(sharedPreferences: ref.read(sharedPreferencesProvider)));
