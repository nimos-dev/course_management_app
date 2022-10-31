import 'package:flutter/foundation.dart';

import '../constants/text_constants.dart';

enum MessageType {
  errorNullValue,

  errorEmailFieldEmpty,
  errorInvalidEmail,

  errorPasswordFieldEmpty,
  errorPasswordTooShort,
  errorPasswordNotIncludeAllRequiredCharacters,
}

extension ErrorMessages on MessageType {
  String get name => describeEnum(this);
  String get errorMessage {
    switch (this) {
      case MessageType.errorNullValue:
        return kErrorNullValueText;
      case MessageType.errorEmailFieldEmpty:
        return kErrorEmailFieldEmpty;
      case MessageType.errorInvalidEmail:
        return kErrorInvalidEmail;
      case MessageType.errorPasswordFieldEmpty:
        return kErrorPasswordFieldEmpty;
      case MessageType.errorPasswordTooShort:
        return kErrorPasswordTooShort;
      case MessageType.errorPasswordNotIncludeAllRequiredCharacters:
        return kErrorPasswordNotIncludeAllRequiredCharacters;
    }
  }
}
