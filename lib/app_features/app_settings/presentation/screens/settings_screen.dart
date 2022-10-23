import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:school_soft_project/app_features/app_settings/app_settings_features/app_theme/dark_mode_switch.dart';
import 'package:school_soft_project/app_features/app_settings/app_settings_features/app_theme/high_contrast_mode_switch.dart';

import '../../../../common_widgets/not_implemented_dialog.dart';
import '../../../app_authentication/app_authentication_providers.dart';

import '../../app_settings_features/app_theme/app_theme_state.dart';
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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 8),
          CustomFrameWidget(
            textLabel: 'Common',
            ref: ref,
            accountSettings: [
              // -----> Dark mode
              SettingsWidget(
                key: const Key('DarkModeSwitch'),
                labelText: 'Enable dark mode',
                prefixIcon: appThemeState.isDarkModeEnabled ?? true ? Icons.wb_cloudy : Icons.wb_sunny,
                sufix: const DarkModeSwitch(),
              ),
              // -----> High contrast mode
              const SettingsWidget(
                labelText: 'Enable high contrast mode',
                prefixIcon: Icons.contrast,
                sufix: HighContrastModeSwitch(),
              ),
              const SettingsWidget(
                labelText: 'Language',
                prefixIcon: Icons.language,
                sufix: LanguageDropdownButton(),
              ),
            ],
          ),

          // ------------>

          CustomFrameWidget(
            textLabel: 'Account',
            ref: ref,
            accountSettings: [
              // -----> User display name
              SettingsWidget(
                labelText: 'Display name',
                prefixIcon: Icons.person,
                sufix: IconButton(
                  onPressed: () => notImplementedDialog(context), // TODO: Implement switch Display name
                  // TODO: Implement 2FA
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
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
              // -----> Sign Out
              SettingsWidget(
                labelText: 'Sign out',
                prefixIcon: Icons.exit_to_app,
                sufix: IconButton(
                  onPressed: () => ref.read(authRepositoryProvider).signOut(),
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  TextEditingController myTextFieldController = TextEditingController();

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          title: const Text('Change Display Name'),
          content: TextField(
            controller: myTextFieldController,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'New name'),
          ),
          actions: [
            TextButton(onPressed: () {}, child: const Text('OK')),
            TextButton(
                onPressed: () async {
                  await ref
                      .read(authRepositoryProvider)
                      .userCredential
                      ?.user
                      ?.updateDisplayName(myTextFieldController.text);
                  await ref.read(authRepositoryProvider).userCredential?.user?.reload();
                  print(ref.read(authRepositoryProvider).userCredential?.user?.displayName);
                  Navigator.pop(this.context);
                },
                child: const Text('Cancel'))
          ],
        ),
      );
}
