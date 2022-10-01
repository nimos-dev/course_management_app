import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'app_theme_state.dart';

class HighContrastModeSwitch extends ConsumerStatefulWidget {
  const HighContrastModeSwitch({Key? key}) : super(key: key);

  @override
  ConsumerState<HighContrastModeSwitch> createState() => _HighContrastModeSwitch();
}

class _HighContrastModeSwitch extends ConsumerState<HighContrastModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Switch(
          value: ref.watch(appThemeStateNotifier).isHighContrastEnabled,
          onChanged: (enabled) {
            if (enabled) {
              ref.read(appThemeStateNotifier).setHighContrastOn();
            } else {
              ref.read(appThemeStateNotifier).setHighContrastOff();
            }
          },
        );
      },
    );
  }
}
