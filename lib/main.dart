import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'app_config/app_config_provider.dart';

import 'app_features/app_settings/app_settings_features/app_theme/app_theme_data.dart';
import 'app_features/app_settings/app_settings_features/app_theme/app_theme_state.dart';

import 'l10n/l10n_provider.dart';
import 'l10n/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  await Hive.openBox('nano_quiz');
  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
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
      title: 'Nano Quiz',
      themeMode: appThemeState.isDarkModeEnabled ?? true ? ThemeMode.dark : ThemeMode.light,
      theme: appThemeState.isHighContrastEnabled ?? false ? highContrastlightTheme() : lightTheme(),
      highContrastTheme: highContrastlightTheme(),
      darkTheme: appThemeState.isHighContrastEnabled ?? false ? highContrastDarkTheme() : darkTheme(),
      highContrastDarkTheme: highContrastDarkTheme(),
      routeInformationProvider: appRouter.router.routeInformationProvider,
      routeInformationParser: appRouter.router.routeInformationParser,
      routerDelegate: appRouter.router.routerDelegate,
    );
  }
}
