import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// TODO: Use Enum DarkModeHighContrast | DarkModeLowContrast | BrightModeHighContrast | BrightModeLowContrast

class AppThemeState extends ChangeNotifier {
  var isDarkModeEnabled = false;

  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    notifyListeners();
  }
}

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());
