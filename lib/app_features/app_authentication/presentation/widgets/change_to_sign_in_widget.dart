import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app_config/app_router/app_router_constants.dart';

class ChangeToSignIn extends StatelessWidget {
  const ChangeToSignIn({
    Key? key,
    required this.state,
  }) : super(key: key);

  final AsyncValue<void> state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account ?'),
        TextButton(
          onPressed: () async => state.isLoading ? null : context.goNamed(loginRouteName),
          child: const Text(
            'Go to Sign In !',
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ],
    );
  }
}
