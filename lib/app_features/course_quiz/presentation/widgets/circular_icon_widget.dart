import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/box_shadow_utils.dart';

class CircularIcon extends ConsumerWidget {
  final IconData icon;
  final Color color;

  const CircularIcon({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 16.0,
      width: 16.0,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: boxShadow),
      child: Icon(icon, color: Colors.white, size: 14.0),
    );
  }
}
