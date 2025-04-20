import 'package:flutter/material.dart';

import 'package:quiz_app/models/Questions.dart';

import 'components/body.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;

  const QuizScreen({super.key, required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
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
      if (selectedIndex == widget.questions[_currentQuestionIndex].correctIndex) {
        correctAnswers++;
      }
    });
    // Future.delayed(Duration(seconds: 3), _nextQuestion);
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
      });
      _pageController.nextPage(
        duration: Duration(milliseconds: 250), 
        curve: Curves.ease
      );
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
          TextButton(
            onPressed: _nextQuestion, 
            child: Text("தவிர்")
          ),
        ],
      ),
      body: Body(
        questions: widget.questions,
        currentIndex: _currentQuestionIndex,
        onAnswerSelected: _checkAnswer,
        selectedAnswer: _selectedAnswer,
        pageController: _pageController,
      ),
    );
  }
}
