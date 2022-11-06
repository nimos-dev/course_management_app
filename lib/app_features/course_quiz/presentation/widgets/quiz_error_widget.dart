import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_soft_project/extensions/string_extension.dart';

import '../../course_quiz_providers.dart';
import 'custom_button_widget.dart';

class QuizError extends ConsumerWidget {
  final String message;

  const QuizError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(color: Colors.white, fontSize: 20.0)),
          const SizedBox(height: 10.0),
          CustomButton(
              title: AppLocalizations.of(context).retry.capitalize(), onTap: () => ref.refresh(quizRepositoryProvider)),
        ],
      ),
    );
  }
}
