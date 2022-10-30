import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_authentication_providers.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({
    Key? key,
    required this.state,
    required this.ref,
  }) : super(key: key);

  final AsyncValue<void> state;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        state.isLoading ? null : ref.read(signInScreenControllerProvider.notifier).signInWithGoogle();
      },
      child: const Text('Sign In With Google'),
    );
  }
}
