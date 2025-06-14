import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/constants/app_constants.dart';
import 'package:quiz_app/screens/stage/stage_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/services/shared_preferences_service.dart';

class RoadmapScreen extends StatefulWidget {
  @override
  _RoadmapScreenState createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
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

  // Method to calculate progress percentage for each level
  Future<double> _getProgressPercentage(int levelIndex) async {
    int completedStages = 0;
    int totalStages = stages.length;

    for (int i = 0; i < totalStages; i++) {
      bool isCompleted =
          await SharedPreferencesService.isStageCompleted(levelIndex, i);
      if (isCompleted) completedStages++;
    }

    return totalStages > 0 ? completedStages / totalStages : 0.0;
  }

  // Method to check if the previous level is completed
  Future<bool> _isPreviousLevelCompleted(int levelIndex) async {
    if (levelIndex == 0) return true; // First level is always accessible
    int previousLevelIndex = levelIndex - 1;
    int totalStages = stages.length;

    for (int i = 0; i < totalStages; i++) {
      bool isCompleted = await SharedPreferencesService.isStageCompleted(
          previousLevelIndex, i);
      if (!isCompleted) return false;
    }
    return true;
  }

  // Refresh the state when the user returns to this screen
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
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
              child: _buildLevelsList(isTablet),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'கற்றல் பாதை',
                        style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: kTextPrimaryColor,
                        ),
                      ),
                      Text(
                        'உங்கள் முன்னேற்றத்தைக் காணுங்கள்',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kTextSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildProfileMenu(),
              ],
            ),
            SizedBox(height: kDefaultPadding),
            _buildOverallProgress(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenu() {
    return Container(
      decoration: BoxDecoration(
        gradient: kPrimaryGradient,
        borderRadius: BorderRadius.circular(kDefaultRadius),
        boxShadow: kCardShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _showLogoutDialog,
          borderRadius: BorderRadius.circular(kDefaultRadius),
          child: Padding(
            padding: EdgeInsets.all(kSmallPadding),
            child: Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverallProgress() {
    return FutureBuilder<double>(
      future: _calculateOverallProgress(),
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0.0;
        return Container(
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            gradient: kAccentGradient,
            borderRadius: BorderRadius.circular(kDefaultRadius),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'மொத்த முன்னேற்றம்',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${(progress * 100).toInt()}% முடிந்தது',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLevelsList(bool isTablet) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTablet ? 3 : 2,
              crossAxisSpacing: kDefaultPadding,
              mainAxisSpacing: kDefaultPadding,
              childAspectRatio: isTablet ? 1.0 : 0.85,
            ),
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              return _buildLevelCard(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLevelCard(int index) {
    return FutureBuilder<bool>(
      future: _isPreviousLevelCompleted(index),
      builder: (context, snapshot) {
        final isAccessible = snapshot.data ?? false;
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: isAccessible
                  ? () => _navigateToLevel(index)
                  : () => _showLockedDialog(),
              borderRadius: BorderRadius.circular(kDefaultRadius),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isAccessible ? kCardColor : kCardColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                  border: isAccessible
                      ? null
                      : Border.all(color: kGrayColor.withOpacity(0.3)),
                  boxShadow: isAccessible ? kCardShadow : [],
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: isAccessible
                                      ? kPrimaryGradient
                                      : LinearGradient(
                                          colors: [kGrayColor, kGrayColor],
                                        ),
                                  borderRadius:
                                      BorderRadius.circular(kSmallRadius),
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              if (!isAccessible)
                                Icon(
                                  Icons.lock_rounded,
                                  color: kGrayColor,
                                  size: 20,
                                ),
                            ],
                          ),
                          SizedBox(height: kSmallPadding),
                          Expanded(
                            child: Text(
                              chapters[index],
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: isAccessible
                                    ? kTextPrimaryColor
                                    : kGrayColor,
                                height: 1.3,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: kSmallPadding),
                          if (isAccessible) _buildProgressIndicator(index),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressIndicator(int index) {
    return FutureBuilder<double>(
      future: _getProgressPercentage(index),
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0.0;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'முன்னேற்றம்',
                  style: GoogleFonts.inter(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: kTextSecondaryColor,
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: kGrayColor.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              borderRadius: BorderRadius.circular(2),
            ),
          ],
        );
      },
    );
  }

  Future<double> _calculateOverallProgress() async {
    double totalProgress = 0.0;
    for (int i = 0; i < chapters.length; i++) {
      totalProgress += await _getProgressPercentage(i);
    }
    return chapters.isNotEmpty ? totalProgress / chapters.length : 0.0;
  }

  void _navigateToLevel(int index) async {
    await Get.to(
      () => StageScreen(levelIndex: index),
      transition: Transition.rightToLeftWithFade,
      duration: Duration(milliseconds: 400),
    );
    setState(() {});
  }

  void _showLockedDialog() {
    Get.snackbar(
      'நிலை பூட்டப்பட்டுள்ளது',
      'இந்த நிலையை திறக்க, முந்தைய நிலையை முடிக்கவும்.',
      backgroundColor: kWarningColor,
      colorText: Colors.white,
      borderRadius: kSmallRadius,
      margin: EdgeInsets.all(kDefaultPadding),
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 3),
      icon: Icon(Icons.lock_rounded, color: Colors.white),
    );
  }

  void _showLogoutDialog() {
    Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(kDefaultPadding),
      content: Column(
        children: [
          Icon(
            Icons.logout_rounded,
            size: 48,
            color: kErrorColor,
          ),
          SizedBox(height: kDefaultPadding),
          Text(
            'வெளியேற விரும்புகிறீர்களா?',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kTextPrimaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: kSmallPadding),
          Text(
            'உங்கள் முன்னேற்றம் சேமிக்கப்படும்.',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kTextSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: kGrayColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kSmallRadius),
                  ),
                ),
                child: Text(
                  'இல்லை',
                  style: GoogleFonts.inter(
                    fontSize: 12 ,
                    fontWeight: FontWeight.w500,
                    color: kTextSecondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: kSmallPadding),
            Expanded(
              child: ElevatedButton(
                onPressed: _handleLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kErrorColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kSmallRadius),
                  ),
                ),
                child: Text(
                  'ஆம்',
                  style: GoogleFonts.inter(
                    fontSize: 12 ,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
      barrierDismissible: true,
      radius: kDefaultRadius,
    );
  }

  void _handleLogout() async {
    await SharedPreferencesService.clearUserData();
    Get.offAll(
      () => WelcomeScreen(),
      transition: Transition.fadeIn,
      duration: Duration(milliseconds: 500),
    );
  }
}
