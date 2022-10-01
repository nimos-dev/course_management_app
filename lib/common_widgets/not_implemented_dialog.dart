import 'package:flutter/material.dart';

Future<dynamic> notImplementedDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: ((context) => AlertDialog(
          title: const Text('Not yet implemented...'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        )),
  );
}
