import 'package:flutter/material.dart';
import 'package:quiz_app/models/Questions.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final Function(int) onAnswerSelected;
  final int? selectedAnswer;

  const QuestionCard({
    required this.question,
    required this.onAnswerSelected,
    this.selectedAnswer,
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
            ),
        ],
      ),
    );
  }
}
