import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config/app_router.dart';
import 'app_features/app_theme_selection/app_theme_data.dart';
import 'app_features/app_theme_selection/app_theme_state.dart';
import 'l10n/l10n_state.dart';
import 'l10n/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider.overrideWithValue(
      sharedPreferences,
    ),
  ], child: MySchoolApp(sharedPreferences: sharedPreferences)));
}

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) => throw UnimplementedError());

class MySchoolApp extends ConsumerStatefulWidget {
  final SharedPreferences sharedPreferences;

  const MySchoolApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  ConsumerState<MySchoolApp> createState() {
    return _MySchoolAppState();
  }
}

class _MySchoolAppState extends ConsumerState<MySchoolApp> {
  @override
  Widget build(BuildContext context) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    final l10nState = ref.watch(l10nStateNotifier);
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      locale: l10nState.locale,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'School Soft Project',
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
