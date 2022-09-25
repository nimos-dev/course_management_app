import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../providers/login_state.dart';
import '../constants/constants.dart';
import '../widgets/custom_text_field_widget.dart';

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
          const CustomTextFieldWidget(labelText: 'E-mail', obscureText: false),
          const CustomTextFieldWidget(labelText: 'Password', obscureText: true),
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
