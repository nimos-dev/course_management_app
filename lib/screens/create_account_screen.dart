import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../providers/login_state.dart';
import '../widgets/custom_text_field_widget.dart';

class CreateAccountScreen extends ConsumerWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Create new account'),
          )),
          const CustomTextFieldWidget(labelText: 'E-mail', obscureText: false),
          const CustomTextFieldWidget(labelText: 'Password', obscureText: true),
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
