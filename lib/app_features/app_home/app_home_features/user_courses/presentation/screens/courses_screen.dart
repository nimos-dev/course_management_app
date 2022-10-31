import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../../global_services/firebase_services/Firestore_service.dart';

class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('users').snapshots();

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => ref.read(firestoreServiceProvider).addUser(),
            child: const Text('Add test data...'),
          ),
        ],
      ),
      Expanded(
        child: StreamBuilder<QuerySnapshot>(
          stream: usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return GestureDetector(
                  onDoubleTap: () => ref.read(firestoreServiceProvider).deleteUser(document.id),
                  onTap: () => ref.read(firestoreServiceProvider).updateUser(document.id, !data['Right']),
                  child: ListTile(
                    title: Text(data['Question']),
                    subtitle: Text(data['Right'].toString()),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    ]);
  }
}
