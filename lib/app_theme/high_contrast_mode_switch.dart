import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HighContrastModeSwitch extends ConsumerStatefulWidget {
  const HighContrastModeSwitch({Key? key}) : super(key: key);

  @override
  ConsumerState<HighContrastModeSwitch> createState() => _HighContrastModeSwitch();
}

//TODO: Implement HighContrastMode

class _HighContrastModeSwitch extends ConsumerState<HighContrastModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Switch(
          value: false,
          onChanged: (enabled) {},
        );
      },
    );
  }
}
