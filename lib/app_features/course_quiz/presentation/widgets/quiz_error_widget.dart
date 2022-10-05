import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/language_constants.dart';
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
          CustomButton(title: retry, onTap: () => ref.refresh(quizRepositoryProvider)),
        ],
      ),
    );
  }
}
