import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

String signinKey = 'signinKey';

String onboardKey = 'onboardKey';

class AppService extends ChangeNotifier {
  AppService({required this.ref, required this.sharedPreferences});

// TODO: Refactor and move, test only...

  UserCredential? userCredential;
  final Ref ref;

  Future<void> signIn(emailAddress, password) async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
      print(userCredential.toString());
      _loginState = true;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e.credential.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      userCredential = null;
      _loginState = false;
      notifyListeners();
      print(userCredential.toString());
    } on FirebaseAuthException catch (e) {
      print(e.credential.toString());
    }
  }
// ----->

  late final SharedPreferences sharedPreferences;

  final StreamController<bool> _loginStateChange = StreamController<bool>.broadcast();

  bool _loginState = false;
  bool _initialized = false;
  bool _onboarding = false;

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onboarding => _onboarding;

  set loginState(bool state) {
    sharedPreferences.setBool(signinKey, state);
    _loginState = state;
    _loginStateChange.add(state);
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set onboarding(bool value) {
    sharedPreferences.setBool(onboardKey, value);
    _onboarding = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    // _onboarding = sharedPreferences.getBool(onboardKey) ?? false;
    _loginState = sharedPreferences.getBool(signinKey) ?? false;

    await Future.delayed(const Duration(seconds: 2));

    _initialized = true;
    notifyListeners();
  }
}

final appServiceProvider =
    Provider<AppService>((ref) => AppService(ref: ref, sharedPreferences: ref.read(sharedPreferencesProvider)));
