import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
    with TickerProviderStateMixin {
  int _currentQuestionIndex = 0;
  int? _selectedAnswer;
  int correctAnswers = 0;
  PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
        _selectedAnswer = null;
      });
      _pageController.nextPage(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _showResults();
    }
  }

  void _showResults() {
    Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(kDefaultPadding),
      content: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: correctAnswers >= widget.questions.length * 0.7
                  ? kSuccessGradient
                  : kPrimaryGradient,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              correctAnswers >= widget.questions.length * 0.7
                  ? Icons.celebration_rounded
                  : Icons.quiz_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Text(
            'முடிவுகள்',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: kTextPrimaryColor,
            ),
          ),
          SizedBox(height: kSmallPadding),
          Text(
            'நீங்கள் ${widget.questions.length} கேள்விகளில் $correctAnswers சரியான பதில்கள் அளித்துள்ளீர்கள்',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kTextSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: kDefaultPadding),
          LinearProgressIndicator(
            value: correctAnswers / widget.questions.length,
            backgroundColor: kGrayColor.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              correctAnswers >= widget.questions.length * 0.7
                  ? kSuccessColor
                  : kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          SizedBox(height: kSmallPadding),
          Text(
            '${((correctAnswers / widget.questions.length) * 100).toInt()}% துல்லியம்',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: correctAnswers >= widget.questions.length * 0.7
                  ? kSuccessColor
                  : kPrimaryColor,
            ),
          ),
        ],
      ),
      actions: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding: EdgeInsets.symmetric(vertical: kSmallPadding),
            ),
            child: Text(
              'தொடர்க',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
      barrierDismissible: false,
      radius: kDefaultRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              children: [
                _buildHeader(),
                _buildProgressIndicator(),
                Expanded(
                  child: _buildQuestionArea(isTablet),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.all(kSmallPadding),
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(kSmallRadius),
                boxShadow: kCardShadow,
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: kTextPrimaryColor,
                size: 24,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'கேள்வி ${_currentQuestionIndex + 1}/${widget.questions.length}',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kTextPrimaryColor,
                ),
              ),
              Text(
                'வினாடி வினா',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: kTextSecondaryColor,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: _nextQuestion,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: kSmallPadding,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: kAccentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(kSmallRadius),
              ),
              child: Text(
                'தவிர்',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kAccentColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'முன்னேற்றம்',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: kTextSecondaryColor,
                ),
              ),
              Text(
                '${((_currentQuestionIndex + 1) / widget.questions.length * 100).toInt()}%',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / widget.questions.length,
            backgroundColor: kGrayColor.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionArea(bool isTablet) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (value) {
        setState(() {
          _currentQuestionIndex = value;
          _selectedAnswer = null;
        });
      },
      itemCount: widget.questions.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(isTablet ? kDefaultPadding * 1.5 : kDefaultPadding),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(kDefaultRadius),
          boxShadow: kCardShadow,
        ),
        child: QuestionCard(
          question: widget.questions[index],
          onAnswerSelected: _checkAnswer,
          selectedAnswer: _selectedAnswer,
          onNextQuestion: _nextQuestion,
        ),
      ),
    );
  }
}
