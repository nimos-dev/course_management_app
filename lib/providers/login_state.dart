import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Implement Firebase Auth

class LoginState extends ChangeNotifier {
  bool _loggedIn = false;

  LoginState();

  bool get loggedIn => _loggedIn;

  void testIn() {
    _loggedIn = true;
    notifyListeners();
  }

  void testOut() {
    _loggedIn = false;
    notifyListeners();
  }
}

final loginStateProvider = Provider<LoginState>((ref) => LoginState());
