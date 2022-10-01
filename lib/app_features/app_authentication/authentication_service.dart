// test

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationService {
  //
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error...'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: const Text('Error...'), content: Text(e.toString()), actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"))
            ]);
          });
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use.'); // popupp insted
      } else {
        print('Error: $e'); // popupp insted
      }
    }
  }

  //  SignOut the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

final authenticationProvider = Provider<AuthenticationService>((ref) => AuthenticationService());

final authStateProvider = StreamProvider<User?>((ref) => ref.read(authenticationProvider).authStateChange);
