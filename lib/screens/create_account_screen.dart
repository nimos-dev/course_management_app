import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../providers/login_state.dart';

class CreateAccountScreen extends ConsumerWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Create new account')),
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
              child: const Text('Create'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account ?'),
              TextButton(
                onPressed: () {
                  context.goNamed(loginRouteName);
                },
                child: const Text(
                  'Sign In !',
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
