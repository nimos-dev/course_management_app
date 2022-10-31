import 'package:flutter/material.dart';
import 'package:school_soft_project/app_features/app_authentication/extensions/validate_string.dart';

import '../../extensions/message_type.dart';

class CustomEmailTextFieldWidget extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController textEditingController;

  const CustomEmailTextFieldWidget({
    Key? key,
    required this.obscureText,
    required this.labelText,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      child: TextFormField(
        validator: validateEmail,
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }

  String? validateEmail(value) {
    String? returnString;

    if (value == null) {
      returnString = MessageType.errorNullValue.errorMessage;
    } else if (value == '') {
      returnString = MessageType.errorEmailFieldEmpty.errorMessage;
    } else if (!value.toString().isValidEmail) {
      returnString = MessageType.errorInvalidEmail.errorMessage;
    } else {
      returnString = null;
    }

    return returnString;
  }
}
