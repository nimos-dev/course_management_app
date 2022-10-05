import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/animated_opacity_constants.dart';
import '../../constants/language_constants.dart';
import '../../controller/course_quiz_state.dart';
import '../../course_quiz_providers.dart';
import '../../models/course_quiz_question_model.dart';
import 'answer_card_widget.dart';

class QuizQuestions extends ConsumerWidget {
  final PageController pageController;
  final CourseQuizState state;
  final List<CourseQuizQuestionModel> questions;

  const QuizQuestions({
    Key? key,
    required this.pageController,
    required this.state,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        return AnimatedOpacity(
          duration: const Duration(milliseconds: animationDuration),
          opacity: ref.watch(animatedOpacityBoolProvider) ? 1.0 : 0.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                '$questionHeading ${index + 1} $ofHeading ${questions.length}',
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
                child: Text(
                  stripHtml(question.question),
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(color: Colors.grey, height: 32.0, thickness: 2.0, indent: 20.0, endIndent: 20.0),
              Column(
                children: question.answers
                    .map(
                      (e) => AnswerCard(
                          answer: stripHtml(e),
                          isSelected: e == state.selectedAnswer,
                          isCorrect: e == question.correctAnswer,
                          isDisplayingAnswer: state.answered,
                          onTap: () => ref.read(quizControllerProvider.notifier).submitAnswer(question, e)),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  // Help function Strip HTML tags from API data...

  static String stripHtml(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }
}
