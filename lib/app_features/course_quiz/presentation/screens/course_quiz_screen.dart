// course_quiz_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/animated_opacity_constants.dart';
import '../../constants/language_constants.dart';
import '../../course_quiz_providers.dart';
import '../../enums/course_quiz_status.dart';
import '../../models/course_quiz_question_model.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/quiz_error_widget.dart';
import '../widgets/quiz_questions_widget.dart';
import '../widgets/quiz_results_widget.dart';

class CourseQuizScreen extends ConsumerStatefulWidget {
  //
  const CourseQuizScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CourseQuizScreen> createState() => _CourseQuizScreenState();
}

class _CourseQuizScreenState extends ConsumerState<CourseQuizScreen> {
  //
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    final quizQuestions = ref.watch(quizQuestionsProvider);

    return Scaffold(
      //----->

      body: quizQuestions.when(
        data: (questions) {
          return _buildBody(context, _pageController, questions);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => const QuizError(message: errorMessage),
      ),

      //----->

      bottomSheet: quizQuestions.maybeWhen(
        data: (questions) {
          final quizState = ref.watch(quizControllerProvider);
          if (quizState.answered == false) return const SizedBox.shrink();
          return AnimatedOpacity(
            duration: const Duration(milliseconds: animationDuration),
            opacity: ref.watch(animatedOpacityBoolProvider) ? 1.0 : 0.0,
            child: CustomButton(
              title: (_pageController.page?.toInt() ?? 0) + 1 < questions.length ? nextQuestion : showResults,
              onTap: () async {
                ref.read(animatedOpacityBoolProvider.state).state = false;
                await Future.delayed(const Duration(milliseconds: animationDuration));
                ref.read(quizControllerProvider.notifier).nextQuestion(questions, _pageController.page?.toInt() ?? 0);

                if ((_pageController.page?.toInt() ?? 0) + 1 < questions.length) {
                  await _pageController.nextPage(
                    duration: const Duration(microseconds: 1),
                    curve: Curves.linear,
                  );
                }
                await Future.delayed(const Duration(milliseconds: animationDuration));
                ref.read(animatedOpacityBoolProvider.state).state = true;
              },
            ),
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),

      //----->
    );
  }

  Widget _buildBody(BuildContext context, PageController pageController, List<CourseQuizQuestionModel> questions) {
    //
    if (questions.isEmpty) return const QuizError(message: errorNoquestions);

    final quizState = ref.watch(quizControllerProvider);

    return quizState.status == CourseQuizStatus.complete
        ? QuizResults(state: quizState, questions: questions)
        : QuizQuestions(pageController: pageController, state: quizState, questions: questions);
  }
}
