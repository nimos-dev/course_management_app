import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_soft_project/app_features/app_authentication/app_authentication_providers.dart';

class FirestoreService {
  //FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference XXXQuestions = FirebaseFirestore.instance.collection('questions');

  Future<void> addQuestion(String question, String answer, bool isRight, String uID) {
    CollectionReference myQuestions =
        FirebaseFirestore.instance.collection('questions').doc(uID).collection('my_questions');

    return myQuestions.add({'Question': question, 'Answer': answer, 'Correct': isRight});
  }

  //Future<void> addUser() {
  //  return myQuestions.add({'Question': 'Test test test?', 'Right': true});
  //}

  //Future<void> updateUser(String docID, bool newValue) {
  //  return myQuestions.doc(docID).update({'Right': newValue});
  // }

  Future<void> deleteUser(String docID, String uID) {
    CollectionReference myQuestions =
        FirebaseFirestore.instance.collection('questions').doc(uID).collection('my_questions');
    return myQuestions.doc(docID).delete();
  }
}

final firestoreServiceProvider = Provider<FirestoreService>((ref) => FirestoreService());
