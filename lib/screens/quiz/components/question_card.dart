import 'package:flutter/material.dart';

import 'package:quiz_app/models/Questions.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final Function(int) onAnswerSelected;
  final Function onNextQuestion;
  final int? selectedAnswer;

  const QuestionCard({
    required this.question,
    required this.onAnswerSelected,
    this.selectedAnswer,
    required this.onNextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
          ),
          SizedBox(height: 12),
          for (int index = 0; index < question.options.length; index++)
            Option(
              index: index,
              text: question.options[index],
              press: () => onAnswerSelected(index),
              isSelected: selectedAnswer == index,
              isCorrect: selectedAnswer == index
                  ? index == question.correctIndex
                  : null,
            ),
          if (selectedAnswer == question.correctIndex) ...[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "சரியானது!",
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () => onNextQuestion(),
                color: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("அடுத்த கேள்விக்கு"),
              ),
            ),
          ],
          if (selectedAnswer != null && selectedAnswer != question.correctIndex)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "தவறானது!",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}
