import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'app_theme/app_theme_data.dart';
import 'app_theme/app_theme_state.dart';
import 'router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MySchoolApp()));
}

class MySchoolApp extends ConsumerStatefulWidget {
  const MySchoolApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MySchoolApp> createState() {
    return _MySchoolAppState();
  }
}

class _MySchoolAppState extends ConsumerState<MySchoolApp> {
  @override
  Widget build(BuildContext context) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My schoolapp',
      themeMode: appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      theme: appThemeState.isHighContrastEnabled ? highContrastlightTheme() : lightTheme(),
      highContrastTheme: highContrastlightTheme(),
      darkTheme: appThemeState.isHighContrastEnabled ? highContrastDarkTheme() : darkTheme(),
      highContrastDarkTheme: highContrastDarkTheme(),
      routeInformationProvider: appRouter.router.routeInformationProvider,
      routeInformationParser: appRouter.router.routeInformationParser,
      routerDelegate: appRouter.router.routerDelegate,
    );
  }
}
