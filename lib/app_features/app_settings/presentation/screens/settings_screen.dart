import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:school_soft_project/app_features/app_settings/app_settings_features/app_theme/dark_mode_switch.dart';
import 'package:school_soft_project/app_features/app_settings/app_settings_features/app_theme/high_contrast_mode_switch.dart';
import 'package:school_soft_project/extensions/string_extension.dart';

import '../../../../common_widgets/text_input_dialog.dart';
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
            textLabel: AppLocalizations.of(context).common.capitalize(),
            ref: ref,
            accountSettings: [
              // -----> Dark mode
              SettingsWidget(
                key: const Key('DarkModeSwitch'),
                labelText: AppLocalizations.of(context).dark_mode.capitalize(),
                prefixIcon: appThemeState.isDarkModeEnabled ?? true ? Icons.wb_cloudy : Icons.wb_sunny,
                sufix: const DarkModeSwitch(),
              ),
              // -----> High contrast mode
              SettingsWidget(
                labelText: AppLocalizations.of(context).high_contrast_mode.capitalize(),
                prefixIcon: Icons.contrast,
                sufix: const HighContrastModeSwitch(),
              ),
              SettingsWidget(
                labelText: AppLocalizations.of(context).language_name.capitalize(),
                prefixIcon: Icons.language,
                sufix: const LanguageDropdownButton(),
              ),
            ],
          ),

          // ------------>

          CustomFrameWidget(
            textLabel: AppLocalizations.of(context).account.capitalize(),
            ref: ref,
            accountSettings: [
              // -----> User display name
              SettingsWidget(
                labelText: AppLocalizations.of(context).display_name.capitalize(),
                prefixIcon: Icons.person,
                sufix: IconButton(
                  onPressed: () {
                    textInputDialogDialog(context, ref, mounted);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),

              // -----> Sign Out
              SettingsWidget(
                labelText: AppLocalizations.of(context).sign_out.capitalize(),
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
}
