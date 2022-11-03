import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_email_text_field_widget.dart';
import '../../app_authentication_providers.dart';
import 'custom_password_text_field_widget.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({
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
            child: Text('Register'),
          )),
          CustomEmailTextFieldWidget(labelText: 'E-mail', obscureText: false, textEditingController: _email),
          CustomPasswordTextFieldWidget(labelText: 'Password', obscureText: true, textEditingController: _password),
          Center(
            child: TextButton(
              onPressed: () {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                FocusScope.of(context).requestFocus(FocusNode());
                if (!_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error:')));
                } else {
                  state.isLoading
                      ? null
                      : ref
                          .read(registerScreenControllerProvider.notifier)
                          .registerWithEmailAndPassword(_email.text, _password.text);
                }
              },
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
  }
}
