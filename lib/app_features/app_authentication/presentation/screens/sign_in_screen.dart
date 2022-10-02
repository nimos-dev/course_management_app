import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app_config/constants.dart';
import '../../../app_settings/presentation/widgets/custom_text_field_widget.dart';
import '../../app_service.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final auth = ref.watch(authenticationProvider);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  ref.read(appServiceProvider).signIn(_email.text, _password.text);
                },
                child: const Text('OK'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account ?'),
                TextButton(
                  onPressed: () async {
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
      ),
    );
  }
}
