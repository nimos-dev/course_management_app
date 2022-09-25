import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageDropdownButton extends ConsumerStatefulWidget {
  const LanguageDropdownButton({Key? key}) : super(key: key);

  @override
  ConsumerState<LanguageDropdownButton> createState() => _LanguageDropdownButtonState();
}

String dropdownValue = 'English';

class _LanguageDropdownButtonState extends ConsumerState<LanguageDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: dropdownValue,
        items: const [
          DropdownMenuItem(value: 'English', child: Text('English')),
          DropdownMenuItem(value: 'German', child: Text('Deutsch')),
          DropdownMenuItem(value: 'French', child: Text('Français')),
          DropdownMenuItem(value: 'Italian', child: Text('Italiano')),
          DropdownMenuItem(value: 'Spanish', child: Text('Español')),
          DropdownMenuItem(value: 'Portuguese', child: Text('Português')),
          DropdownMenuItem(value: 'Swedish', child: Text('Svenska')),
          DropdownMenuItem(value: 'Norwegian', child: Text('Norsk')),
          DropdownMenuItem(value: 'Danish', child: Text('Dansk')),
        ],
        onChanged: (String? value) {
          if (value is String) {
            setState(() {
              dropdownValue = value;
            });

            print(dropdownValue);
          }
        },
      ),
    );
  }
}
