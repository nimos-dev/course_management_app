import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n_state.dart';

class LanguageDropdownButton extends ConsumerStatefulWidget {
  const LanguageDropdownButton({Key? key}) : super(key: key);

  @override
  ConsumerState<LanguageDropdownButton> createState() => _LanguageDropdownButtonState();
}

class _LanguageDropdownButtonState extends ConsumerState<LanguageDropdownButton> {
  late Locale dropdownValue;

  @override
  void initState() {
    dropdownValue = ref.read(l10nStateNotifier).locale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10nState = ref.watch(l10nStateNotifier);

    return DropdownButtonHideUnderline(
      child: DropdownButton<Locale>(
        value: l10nState.locale,
        items: const [
          DropdownMenuItem(value: Locale('da'), child: Text('Dansk')),
          DropdownMenuItem(value: Locale('de'), child: Text('Deutsch')),
          DropdownMenuItem(value: Locale('en'), child: Text('English')),
          DropdownMenuItem(value: Locale('es'), child: Text('Español')),
          DropdownMenuItem(value: Locale('fr'), child: Text('Français')),
          DropdownMenuItem(value: Locale('it'), child: Text('Italiano')),
          DropdownMenuItem(value: Locale('nb'), child: Text('Norsk')),
          DropdownMenuItem(value: Locale('pt'), child: Text('Português')),
          DropdownMenuItem(value: Locale('sv'), child: Text('Svenska')),
        ],
        onChanged: (Locale? value) {
          ref.read(l10nStateNotifier).setLocale(value!);
        },
      ),
    );
  }
}
