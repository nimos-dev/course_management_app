import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// TODO: Use Enum DarkModeHighContrast | DarkModeLowContrast | BrightModeHighContrast | BrightModeLowContrast

class AppThemeState extends ChangeNotifier {
  var isDarkModeEnabled = true;
  var isHighContrastEnabled = false;

  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    notifyListeners();
  }

  void setHighContrastOn() {
    isHighContrastEnabled = true;
    notifyListeners();
  }

  void setHighContrastOff() {
    isHighContrastEnabled = false;
    notifyListeners();
  }
}

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());
