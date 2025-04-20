import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/constants/app_constants.dart';
import 'package:quiz_app/screens/stage/stage_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/services/shared_preferences_service.dart';

class RoadmapScreen extends StatefulWidget {
  @override
  _RoadmapScreenState createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("கற்றல் பாதை"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Handle logout action here
              Get.defaultDialog(
                title: "Logout",
                content: Text("Are you sure you want to logout?"),
                confirm: ElevatedButton(
                  onPressed: () async {
                    await SharedPreferencesService.clearUserData();
                    Get.offAll(
                      () => WelcomeScreen(),
                      transition: Transition.fadeIn,
                      duration: Duration(milliseconds: 300),
                    );
                  },
                  child: Text("Yes"),
                ),
                cancel: ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text("No"),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  for (int index = 0; index < chapters.length; index++)
                    FutureBuilder<bool>(
                      future: _isPreviousLevelCompleted(index),
                      builder: (context, snapshot) {
                        final isAccessible = snapshot.data ?? false;
                        return GestureDetector(
                          onTap: isAccessible
                              ? () async {
                                  await Get.to(
                                    () => StageScreen(
                                      levelIndex: index,
                                    ),
                                  );
                                  setState(() {});
                                }
                              : () {
                                  Get.snackbar(
                                    "பூட்டப்பட்ட நிலை",
                                    "இந்த நிவலை திறக்க, முந்தைய நிலையை முடிக்கவும்.",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                },
                          child: Stack(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: kDefaultPadding),
                                padding: EdgeInsets.all(kDefaultPadding),
                                decoration: BoxDecoration(
                                  color: isAccessible
                                      ? Colors.white.withOpacity(0.2)
                                      : Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      chapters[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    FutureBuilder<double>(
                                      future: _getProgressPercentage(index),
                                      builder: (context, snapshot) {
                                        final progress = snapshot.data ?? 0.0;
                                        final starCount =
                                            4; // Total number of stars
                                        final filledStars =
                                            (progress * starCount).ceil();
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List.generate(starCount,
                                                  (starIndex) {
                                                return Icon(
                                                  Icons.star,
                                                  color: starIndex < filledStars
                                                      ? Colors.amber
                                                      : Colors.grey
                                                          .withOpacity(0.3),
                                                  size: 20,
                                                );
                                              }),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              if (!isAccessible)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
