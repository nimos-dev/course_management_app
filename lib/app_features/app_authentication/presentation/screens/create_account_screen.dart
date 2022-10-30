import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:school_soft_project/app_features/app_authentication/presentation/widgets/change_to_sign_in_widget.dart';

import '../../app_authentication_providers.dart';
import '../widgets/register_form_widget.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _email = TextEditingController();

  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //
    final AsyncValue<void> state = ref.watch(registerScreenControllerProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                RegisterFormWidget(formKey: _formKey, email: _email, password: _password, state: state, ref: ref),
                ChangeToSignIn(state: state)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
