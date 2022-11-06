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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Image.asset('assets/pictures/temp_pic.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('1: Test your knowledge by taking a nano-quiz'),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('2: Repeat the subjects you didn\'t know the answers to'),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('3: Try again to see if you understood everything'),
              ),
            ],
          ),
          TextButton(
            key: const Key('OnboardScreen_TextButton_Done'),
            onPressed: () {
              ref.read(authRepositoryProvider).onboarding = true;
            },
            child: const Text('Start now!'),
          )
        ],
      )),
    );
  }
}
