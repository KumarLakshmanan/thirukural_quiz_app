import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/constants/app_constants.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/services/shared_preferences_service.dart';
import 'package:quiz_app/screens/stage/thirukural_screen.dart';
import 'package:quiz_app/screens/stage/video_screen.dart';
import 'package:quiz_app/screens/stage/photos_screen.dart';

class StageScreen extends StatefulWidget {
  StageScreen({required this.levelIndex});
  final int levelIndex;

  @override
  _StageScreenState createState() => _StageScreenState();
}

class _StageScreenState extends State<StageScreen>
    with TickerProviderStateMixin {
  late List<bool> stageCompletionStatus;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    stageCompletionStatus =
        List.filled(appLevels[widget.levelIndex].stages.length, false);
    _loadStageCompletionStatus();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
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

  Future<void> _loadStageCompletionStatus() async {
    for (int i = 0; i < stageCompletionStatus.length; i++) {
      stageCompletionStatus[i] =
          await SharedPreferencesService.isStageCompleted(widget.levelIndex, i);
    }
    setState(() {});
  }

  void navigateToStage(BuildContext context, int stageIndex) async {
    final stage = appLevels[widget.levelIndex].stages[stageIndex];
    await SharedPreferencesService.setStageCompleted(
        widget.levelIndex, stageIndex);
    switch (stage.type) {
      case StageType.thirukural:
        await Get.to(() => ThirukuralScreen(stage: stage));
        break;
      case StageType.video:
        await Get.to(() => VideoScreen(stage: stage));
        break;
      case StageType.photos:
        await Get.to(() => PhotosScreen(stage: stage));
        break;
      case StageType.quiz:
        if (stage.questions != null && stage.questions!.isNotEmpty) {
          await Get.to(() => QuizScreen(questions: stage.questions!));
        } else {
          Get.snackbar('Error', 'No questions available for this quiz');
        }
        break;
    }
    // Reload stage completion status after returning
    _loadStageCompletionStatus();
  }

  IconData _getStageIcon(StageType type) {
    switch (type) {
      case StageType.thirukural:
        return Icons.menu_book_rounded;
      case StageType.video:
        return Icons.play_circle_rounded;
      case StageType.photos:
        return Icons.photo_library_rounded;
      case StageType.quiz:
        return Icons.quiz_rounded;
    }
  }

  Color _getStageColor(StageType type) {
    switch (type) {
      case StageType.thirukural:
        return kPrimaryColor;
      case StageType.video:
        return kSecondaryColor;
      case StageType.photos:
        return kAccentColor;
      case StageType.quiz:
        return kSuccessColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildStagesList(isTablet),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: kCardColor,
          boxShadow: kCardShadow,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.all(kSmallPadding),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
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
            SizedBox(width: kDefaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLevels[widget.levelIndex].name,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kTextPrimaryColor,
                    ),
                  ),
                  Text(
                    'நிலை ${widget.levelIndex + 1}',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kTextSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            _buildProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final completedCount =
        stageCompletionStatus.where((status) => status).length;
    final totalCount = stageCompletionStatus.length;
    final progress = totalCount > 0 ? completedCount / totalCount : 0.0;

    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      child: Stack(
        children: [
          CircularProgressIndicator(
            value: progress,
            backgroundColor: kGrayColor.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            strokeWidth: 4,
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Text(
              '$completedCount/$totalCount',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStagesList(bool isTablet) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: ListView.builder(
          padding: EdgeInsets.all(kDefaultPadding),
          itemCount: appLevels[widget.levelIndex].stages.length,
          itemBuilder: (context, index) {
            return _buildStageCard(index);
          },
        ),
      ),
    );
  }

  Widget _buildStageCard(int index) {
    final stage = appLevels[widget.levelIndex].stages[index];
    final isCompleted = stageCompletionStatus[index];
    final stageColor = _getStageColor(stage.type);

    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => navigateToStage(context, index),
          borderRadius: BorderRadius.circular(kDefaultRadius),
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: isCompleted ? stageColor.withOpacity(0.1) : kCardColor,
              borderRadius: BorderRadius.circular(kDefaultRadius),
              border: Border.all(
                color: isCompleted
                    ? stageColor.withOpacity(0.3)
                    : kGrayColor.withOpacity(0.2),
                width: 1,
              ),
              boxShadow: kCardShadow,
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color:
                        isCompleted ? stageColor : stageColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                  ),
                  child: Icon(
                    _getStageIcon(stage.type),
                    color: isCompleted ? Colors.white : stageColor,
                    size: 28,
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stage.title,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kTextPrimaryColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        _getStageDescription(stage.type),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kTextSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isCompleted)
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kSuccessColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                if (!isCompleted)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: kTextSecondaryColor,
                    size: 16,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getStageDescription(StageType type) {
    switch (type) {
      case StageType.thirukural:
        return 'திருக்குறள் படித்து கற்றுக்கொள்ளுங்கள்';
      case StageType.video:
        return 'கதை வீடியோ பார்த்து புரிந்துகொள்ளுங்கள்';
      case StageType.photos:
        return 'படங்களை பார்த்து அர்த்தம் அறியுங்கள்';
      case StageType.quiz:
        return 'வினாடி வினாவில் பங்கேற்று சோதித்துக்கொள்ளுங்கள்';
    }
  }
}
