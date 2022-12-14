import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_soft_project/extensions/string_extension.dart';
import 'package:school_soft_project/global_services/hive_services/hive_service.dart';

import '../../constants/animated_opacity_constants.dart';
import '../../constants/language_constants.dart';
import '../../controller/course_quiz_state.dart';
import '../../course_quiz_providers.dart';
import '../../models/course_quiz_question_model.dart';
import 'custom_button_widget.dart';

class QuizResults extends ConsumerWidget {
  final CourseQuizState state;
  final List<CourseQuizQuestionModel> questions;

  const QuizResults({Key? key, required this.state, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: animationDuration),
      opacity: ref.watch(animatedOpacityBoolProvider) ? 1.0 : 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${state.correct.length} / ${questions.length}',
            style: const TextStyle(fontSize: 60.0, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Text(
            AppLocalizations.of(context).correct.capitalize(),
            style: const TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40.0),
          CustomButton(
            title: AppLocalizations.of(context).newQuiz.capitalize(),
            onTap: () async {
              ref.read(hiveServiceProvider).addTestData(state.correct.length);
              ref.read(animatedOpacityBoolProvider.state).state = false;
              await ref.refresh(quizQuestionsProvider.future);
              await Future.delayed(const Duration(milliseconds: animationDuration));
              ref.read(animatedOpacityBoolProvider.state).state = true;
              ref.read(quizControllerProvider.notifier).reset();
            },
          ),
        ],
      ),
    );
  }
}
