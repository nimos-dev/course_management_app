import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_authentication/app_authentication_providers.dart';

class OnboardScreen extends ConsumerWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Onboard Screen!'),
          TextButton(
            onPressed: () {
              ref.read(authRepositoryProvider).onboarding = true;
            },
            child: const Text('Done!'),
          )
        ],
      )),
    );
  }
}
