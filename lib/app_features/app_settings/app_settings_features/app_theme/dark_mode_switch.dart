import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'app_theme_state.dart';

class DarkModeSwitch extends ConsumerStatefulWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

  @override
  ConsumerState<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends ConsumerState<DarkModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Switch(
          value: ref.watch(appThemeStateNotifier).isDarkModeEnabled ?? true,
          onChanged: (enabled) {
            if (enabled) {
              ref.read(appThemeStateNotifier).setDarkTheme();
            } else {
              ref.read(appThemeStateNotifier).setLightTheme();
            }
          },
        );
      },
    );
  }
}
