import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_repository_interface.dart';

String signinKey = 'signinKey';
String onboardKey = 'onboardKey';

class AuthRepository extends ChangeNotifier implements AuthRepositoryInterface {
  AuthRepository({required this.ref, required this.sharedPreferences});

  final StreamController<bool> _loginStateChange = StreamController<bool>.broadcast();
  final SharedPreferences sharedPreferences;
  final Ref ref;

  UserCredential? userCredential;

  bool _loginState = false;
  bool _initialized = false;
  bool _onboarding = false;

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onboarding => _onboarding;

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set loginState(bool state) {
    sharedPreferences.setBool(signinKey, state);
    _loginState = state;
    _loginStateChange.add(state);
  }

  set onboarding(bool value) {
    sharedPreferences.setBool(onboardKey, value);
    _onboarding = value;
    notifyListeners();
  }

  // ----->

  @override
  Future<void> onAppStart() async {
    _onboarding = sharedPreferences.getBool(onboardKey) ?? false; // Get from sharedPreferences
    loginState = sharedPreferences.getBool(signinKey) ?? false;
    await Future.delayed(const Duration(seconds: 2));
    _initialized = true;
    notifyListeners();
  }

  // ----->

  @override
  Future<void> signInWithEmailAndPassword(emailAddress, password) async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
      loginState = true;

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.credential.toString());
      }
    }
  }

  // ----->

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      userCredential = null;
      loginState = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.credential.toString());
      }
    }
  }

  // ----->
}
