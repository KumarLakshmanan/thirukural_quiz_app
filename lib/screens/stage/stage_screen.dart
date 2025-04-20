import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/constants/app_constants.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/services/shared_preferences_service.dart';
import 'package:quiz_app/screens/stage/thirukural_screen.dart';
import 'package:quiz_app/screens/stage/video_screen.dart';
import 'package:quiz_app/screens/stage/photos_screen.dart';

class StageScreen extends StatelessWidget {
  StageScreen({required this.levelIndex});
  final int levelIndex;

  Future<bool> isStageCompleted(int stageIndex) async {
    return await SharedPreferencesService.isStageCompleted(
        levelIndex, stageIndex);
  }

  void navigateToStage(BuildContext context, int stageIndex) {
    final stage = appLevels[levelIndex].stages[stageIndex];

    switch (stage.type) {
      case StageType.thirukural:
        Get.to(() => ThirukuralScreen(
              kural: stage.kural!,
              explanation: stage.explanation!,
            ));
        break;
      case StageType.video:
        Get.to(() => VideoScreen(
              videoUrl: stage.videoUrl!,
              title: stage.title,
            ));
        break;
      case StageType.photos:
        Get.to(() => PhotosScreen(
              title: stage.title,
              photos: stage.images!,
            ));
        break;
      case StageType.quiz:
        if (stage.questions != null && stage.questions!.isNotEmpty) {
          Get.to(
            () => QuizScreen(
              questions: appLevels[levelIndex].stages[3].questions!,
            ),
          );
        } else {
          Get.snackbar('Error', 'No questions available for this quiz');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    appLevels[levelIndex].name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: appLevels[levelIndex].stages.length,
                    padding: const EdgeInsets.all(kDefaultPadding),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                    ),
                    itemBuilder: (context, index) => FutureBuilder<bool>(
                      future: isStageCompleted(index),
                      builder: (context, snapshot) {
                        final isCompleted = snapshot.data ?? false;
                        return GestureDetector(
                          onTap: () => navigateToStage(context, index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isCompleted
                                  ? Colors.green.withValues(alpha: 0.3)
                                  : Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  appLevels[levelIndex].stages[index].title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (isCompleted)
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                              ],
                            ),
                          ),
                        );
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
