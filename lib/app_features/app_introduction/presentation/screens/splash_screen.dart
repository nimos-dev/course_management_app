import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_authentication/app_authentication_providers.dart';
import '../../../app_authentication/repositories/auth_repository.dart';
import '../widgets/splash_progress_indicator.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late AuthRepository _appService;
  @override
  void initState() {
    _appService = ref.read(authRepositoryProvider);
    onAppStartUp();

    super.initState();
  }

  void onAppStartUp() async => await _appService.onAppStart();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashProgressIndicator(),
    );
  }
}
