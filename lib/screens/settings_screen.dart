import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../app_theme/app_theme_state.dart';
import '../app_theme/high_contrast_mode_switch.dart';
import '../app_theme/dark_mode_switch.dart';
import '../miscellaneous/not_implemented_dialog.dart';
import '../providers/login_state.dart';
import '../widgets/language_dropdown_button_widget.dart';
import '../widgets/settings_widget.dart';
import '../widgets/custom_frame_widget.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 8),
          CustomFrameWidget(
            textLabel: 'Common',
            ref: ref,
            accountSettings: [
              // -----> Dark mode
              SettingsWidget(
                labelText: 'Enable dark mode',
                prefixIcon: appThemeState.isDarkModeEnabled ? Icons.wb_cloudy : Icons.wb_sunny,
                sufix: const DarkModeSwitch(),
              ),
              // -----> High contrast mode
              const SettingsWidget(
                labelText: 'Enable high contrast mode',
                prefixIcon: Icons.contrast,
                sufix: HighContrastModeSwitch(), // TODO: Implement HighContrastModeSwitch()
              ),
              const SettingsWidget(
                labelText: 'Language',
                prefixIcon: Icons.language,
                sufix: LanguageDropdownButton(), // TODO: Implement LanguageDropdownButton()
              ),
            ],
          ),

          // ------------>

          CustomFrameWidget(
            textLabel: 'Account',
            ref: ref,
            accountSettings: [
              // -----> Phone number
              SettingsWidget(
                labelText: 'Phone number',
                prefixIcon: Icons.phone,
                sufix: IconButton(
                  onPressed: () => notImplementedDialog(context), // TODO: Implement switch phone number
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              // -----> Email
              SettingsWidget(
                labelText: 'Email',
                prefixIcon: Icons.email,
                sufix: IconButton(
                  onPressed: () => notImplementedDialog(context), // TODO: Implement switch Email
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              // -----> New Password
              SettingsWidget(
                labelText: 'New password',
                prefixIcon: Icons.password,
                sufix: IconButton(
                  onPressed: () => notImplementedDialog(context), // TODO: Implement switch password
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              // -----> Two-factor authentication
              SettingsWidget(
                labelText: 'Two-factor authentication',
                prefixIcon: Icons.lock,
                sufix: IconButton(
                  onPressed: () => notImplementedDialog(context), // TODO: Implement 2FA
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              // -----> Sign Out
              SettingsWidget(
                labelText: 'Sign out',
                prefixIcon: Icons.exit_to_app,
                sufix: IconButton(
                  onPressed: () => ref.read(loginStateProvider).testOut(),
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
