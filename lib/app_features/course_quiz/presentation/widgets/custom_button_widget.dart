import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/box_shadow_utils.dart';

class CustomButton extends ConsumerWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        child: Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
