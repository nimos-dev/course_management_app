import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_soft_project/global_services/hive_services/hive_service.dart';

import '../app_features/app_authentication/app_authentication_providers.dart';

Future<dynamic> textInputDialogDialog(BuildContext context, WidgetRef ref, bool mounted) {
  TextEditingController textEditingController = TextEditingController();

  return showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        title: const Text('Enter new Name'),
        content: TextField(
          controller: textEditingController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.currentUser?.updateDisplayName(textEditingController.value.text);
              await FirebaseAuth.instance.currentUser?.reload();
              String? uID = ref.read(authRepositoryProvider).getUserID();
              if (uID != null) {
                ref.read(hiveServiceProvider).setUserName(textEditingController.value.text);
              }
              if (!mounted) return;
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    }),
  );
}
