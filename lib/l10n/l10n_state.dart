import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_soft_project/l10n/l10n.dart';

class L10nState extends ChangeNotifier {
  Locale _locale = Locale(Platform.localeName.substring(0, 2)); // TODO: Load/Save in HIVE...

  Locale get locale {
    return _locale;
  }

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }
}

final l10nStateNotifier = ChangeNotifierProvider((ref) => L10nState());
