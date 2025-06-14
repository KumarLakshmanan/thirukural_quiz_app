import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
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
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Text(
            question.question,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kTextPrimaryColor,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Column(
          children: [
            for (int index = 0; index < question.options.length; index++)
              Padding(
                padding: EdgeInsets.only(bottom: kSmallPadding),
                child: Option(
                  index: index,
                  text: question.options[index],
                  press: () => onAnswerSelected(index),
                  isSelected: selectedAnswer == index,
                  isCorrect: selectedAnswer == index
                      ? index == question.correctIndex
                      : null,
                ),
              ),
            if (selectedAnswer != null) ...[
              SizedBox(height: kDefaultPadding),
              _buildFeedback(),
              SizedBox(height: kDefaultPadding),
              _buildNextButton(),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildFeedback() {
    final isCorrect = selectedAnswer == question.correctIndex;
    return Container(
      padding: EdgeInsets.all(kSmallPadding),
      decoration: BoxDecoration(
        color: isCorrect 
            ? kSuccessColor.withOpacity(0.1)
            : kErrorColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(kSmallRadius),
        border: Border.all(
          color: isCorrect ? kSuccessColor : kErrorColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: isCorrect ? kSuccessColor : kErrorColor,
            size: 20,
          ),
          SizedBox(width: kSmallPadding),
          Text(
            isCorrect ? "சரியானது!" : "தவறானது!",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isCorrect ? kSuccessColor : kErrorColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        gradient: kPrimaryGradient,
        borderRadius: BorderRadius.circular(kSmallRadius),
        boxShadow: kCardShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onNextQuestion(),
          borderRadius: BorderRadius.circular(kSmallRadius),
          child: Center(
            child: Text(
              "அடுத்த கேள்விக்கு",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
