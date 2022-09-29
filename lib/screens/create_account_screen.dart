import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../providers/app_service.dart';
import '../widgets/custom_text_field_widget.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  CreateAccountScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _email = TextEditingController();

  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Create new account'),
            )),
            CustomTextFieldWidget(labelText: 'E-mail', obscureText: false, textEditingController: _email),
            CustomTextFieldWidget(labelText: 'Password', obscureText: true, textEditingController: _password),
            Center(
              child: TextButton(
                onPressed: () {
                  ref.read(appServiceProvider).loginState = true;
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
      ),
    );
  }
}

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
