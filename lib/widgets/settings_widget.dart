import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final IconData prefixIcon;
  final String labelText;
  final Widget sufix;

  const SettingsWidget({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    required this.sufix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(prefixIcon),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(labelText),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: sufix),
      ],
    );
  }
}
