import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

// TODO: Only technical placeholder not implemented
ThemeData highContrastlightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    backgroundColor: const Color(0xFF212121),
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF212121)),
  );
}

// TODO: Only technical placeholder not implemented
ThemeData highContrastDarkTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    backgroundColor: const Color(0xFF212121),
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: Colors.amber,
      primary: Colors.grey,
      onPrimary: Colors.black,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF212121)),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Colors.grey;
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Colors.amber;
        }
        return null;
      }),
    ),
  );
}


        /* https://api.flutter.dev/flutter/material/ColorScheme/ColorScheme.dark.html 
        
        brightness: Brightness.dark,
        primary: Color(0xffbb86fc),
        onPrimary: Colors.black,
        secondary: Color(0xff03dac6),
        onSecondary: Colors.black,
        error: Color(0xffcf6679),
        onError: Colors.black,
        background: Color(0xff121212),
        onBackground: Colors.white,
        surface: Color(0xff121212),
        onSurface: Colors.white), */

        /* https://api.flutter.dev/flutter/material/ColorScheme/ColorScheme.light.html 
        
        this.brightness = Brightness.light,
        this.primary = const Color(0xff6200ee),
        this.onPrimary = Colors.white,
        this.secondary = const Color(0xff03dac6),
        this.onSecondary = Colors.black,
        this.error = const Color(0xffb00020),
        this.onError = Colors.white,
        this.background = Colors.white,
        this.onBackground = Colors.black,
        this.surface = Colors.white,
        this.onSurface = Colors.black,
        */