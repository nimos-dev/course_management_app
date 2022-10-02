import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CustomFrameWidget extends StatelessWidget {
  final String textLabel;
  final WidgetRef ref;
  final List<Widget> accountSettings;

  const CustomFrameWidget({Key? key, required this.ref, required this.accountSettings, required this.textLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ...[const SizedBox(height: 8)],
            ...accountSettings
          ]),
        ),
        Positioned(
            left: 50,
            top: 12,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(textLabel, style: const TextStyle(fontSize: 14)),
            )),
      ],
    );
  }
}
