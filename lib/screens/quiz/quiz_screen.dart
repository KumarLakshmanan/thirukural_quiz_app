import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/quiz/components/question_card.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;

  const QuizScreen({super.key, required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  int _currentQuestionIndex = 0;
  int? _selectedAnswer;
  int correctAnswers = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  void _checkAnswer(int selectedIndex) {
    setState(() {
      _selectedAnswer = selectedIndex;
      if (selectedIndex ==
          widget.questions[_currentQuestionIndex].correctIndex) {
        correctAnswers++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex = _pageController.page!.toInt() - 1;
        _selectedAnswer = null;
      });
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: _nextQuestion, child: Text("தவிர்")),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF252c4a).withValues(alpha: 0.5),
              image: DecorationImage(
                image: AssetImage("assets/icons/bg.png"),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
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
                      text: "கேள்வி ${_currentQuestionIndex + 1}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${widget.questions.length}",
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
                    controller: _pageController,
                    itemCount: widget.questions.length,
                    onPageChanged: (value) {
                      setState(() {
                        _currentQuestionIndex = value;
                        _selectedAnswer = null;
                      });
                    },
                    itemBuilder: (context, index) => QuestionCard(
                      question: widget.questions[index],
                      onAnswerSelected: (index) {
                        _checkAnswer(index);
                      },
                      selectedAnswer: _selectedAnswer,
                      onNextQuestion: () {
                        if (_currentQuestionIndex < widget.questions.length - 1) {
                          setState(() {
                            _selectedAnswer = null;
                          });
                          _pageController.nextPage(
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
      ),
    );
  }
}
