import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_settings/presentation/widgets/custom_text_field_widget.dart';
import '../../app_authentication_providers.dart';

// TODO: Rebuild and reuse in create account

class AuthFormWidget extends StatelessWidget {
  const AuthFormWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController email,
    required TextEditingController password,
    required this.state,
    required this.ref,
  })  : _formKey = formKey,
        _email = email,
        _password = password,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _email;
  final TextEditingController _password;
  final AsyncValue<void> state;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Sign In'),
          )),
          CustomTextFieldWidget(labelText: 'E-mail', obscureText: false, textEditingController: _email),
          CustomTextFieldWidget(labelText: 'Password', obscureText: true, textEditingController: _password),
          Center(
            child: TextButton(
              onPressed: () {
                state.isLoading
                    ? null
                    : ref
                        .read(signInScreenControllerProvider.notifier)
                        .signInWithEmailAndPassword(_email.text, _password.text);
              },
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
  }
}
