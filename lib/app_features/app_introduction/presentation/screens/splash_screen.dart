import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_authentication/app_authentication_providers.dart';
import '../../../app_authentication/repositories/auth_repository.dart';
import '../../../app_settings/app_settings_features/app_theme/app_theme_state.dart';
import '../widgets/splash_progress_indicator.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late AuthRepository _appService;
  late AppThemeState _appThemeState;
  @override
  void initState() {
    _appThemeState = ref.read(appThemeStateNotifier);
    _appService = ref.read(authRepositoryProvider);

    loadAppThemeStateOnAppStart();
    onAppStartUp();

    super.initState();
  }

  void loadAppThemeStateOnAppStart() async => await _appThemeState.loadAppThemeStateOnAppStart();

  void onAppStartUp() async => await _appService.onAppStart();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: SplashProgressIndicator(),
    );
  }
}
