import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../app_authentication_providers.dart';
import '../widgets/auth_form_widget.dart';
import '../widgets/change_to_widget.dart';

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
    //
    final AsyncValue<void> state = ref.watch(signInScreenControllerProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                AuthFormWidget(formKey: _formKey, email: _email, password: _password, state: state, ref: ref),
                ChangeTo(state: state)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
