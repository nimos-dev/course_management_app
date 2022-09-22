import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../providers/login_state.dart';
import '../constants/constants.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Sign In'),
          )),
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                ref.read(loginStateProvider).testIn();
              },
              child: const Text('OK'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account ?'),
              TextButton(
                onPressed: () {
                  context.goNamed(createAccountRouteName);
                },
                child: const Text(
                  'Create new account !',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
