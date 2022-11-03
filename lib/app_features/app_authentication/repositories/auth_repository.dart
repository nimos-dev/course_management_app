import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:school_soft_project/global_services/hive_services/hive_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_repository_interface.dart';

String signinKey = 'signinKey';
String onboardKey = 'onboardKey';

class AuthRepository extends ChangeNotifier implements AuthRepositoryInterface {
  AuthRepository({required this.ref, required this.sharedPreferences});

  final StreamController<bool> _loginStateChange = StreamController<bool>.broadcast();
  final SharedPreferences sharedPreferences;
  final Ref ref;

  User? user;
  String displayName = 'Anonymous';

  bool _loginState = false;
  bool _initialized = false;
  bool _onboarding = false;

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onboarding => _onboarding;

  String? getUserID() {
    return user?.uid;
  }

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
  Future<void> signInWithEmailAndPassword(emailAddress, password, context) async {
    String errorString = '';

    try {
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => value.user);

      loginState = true;
      ref.read(hiveServiceProvider).setUserName(user?.displayName ?? '');

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorString = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorString = 'Wrong password provided !';
      }
    }

    if (errorString != '') {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occured'),
          content: Text(errorString),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  // ----->

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      user = null;
      loginState = false;
      ref.read(hiveServiceProvider).setUserName(user?.displayName ?? '');
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.credential.toString());
      }
    }
  }

  // ----->

  @override
  Future<void> registerWithEmailAndPassword(String email, String password) async {
    try {
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user);
      loginState = true;
      ref.read(hiveServiceProvider).setUserName(user?.displayName ?? '');
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential =
        GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    user = await FirebaseAuth.instance.signInWithCredential(credential).then((value) => value.user);
    if (user != null) {
      loginState = true;
      ref.read(hiveServiceProvider).setUserName(user?.displayName ?? '');
      notifyListeners();
    }
  }
}
