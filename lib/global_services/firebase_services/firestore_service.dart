import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users.add({'Question': 'Test test test?', 'Right': true});
  }

  Future<void> updateUser(String docID, bool newValue) {
    return users.doc(docID).update({'Right': newValue});
  }

  Future<void> deleteUser(String docID) {
    return users.doc(docID).delete();
  }
}

final firestoreServiceProvider = Provider<FirestoreService>((ref) => FirestoreService());
