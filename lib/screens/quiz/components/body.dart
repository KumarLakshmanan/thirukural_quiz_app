import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:flutter_svg/svg.dart';

import 'package:quiz_app/models/Questions.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  final List<Question> questions;
  final int currentIndex;
  final Function(int) onAnswerSelected;
  final int? selectedAnswer;
  final PageController pageController;

  const Body({
    super.key,
    required this.questions,
    required this.currentIndex,
    required this.onAnswerSelected,
    this.selectedAnswer,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text.rich(
                  TextSpan(
                    text: "கேள்வி ${currentIndex + 1}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: kSecondaryColor),
                    children: [
                      TextSpan(
                        text: "/${questions.length}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: kSecondaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  itemCount: questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: questions[index],
                    onAnswerSelected: onAnswerSelected,
                    selectedAnswer: selectedAnswer,
                    onNextQuestion: () {
                      if (currentIndex < questions.length - 1) {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.ease,
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
