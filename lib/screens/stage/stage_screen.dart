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

class StageScreen extends StatefulWidget {
  StageScreen({required this.levelIndex});
  final int levelIndex;

  @override
  _StageScreenState createState() => _StageScreenState();
}

class _StageScreenState extends State<StageScreen> {
  late List<bool> stageCompletionStatus;

  @override
  void initState() {
    super.initState();
    stageCompletionStatus =
        List.filled(appLevels[widget.levelIndex].stages.length, false);
    _loadStageCompletionStatus();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(appLevels[widget.levelIndex].name,
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          ListView(
            padding: const EdgeInsets.all(kDefaultPadding),
            children: [
              for (int index = 0;
                  index < appLevels[widget.levelIndex].stages.length;
                  index++)
                GestureDetector(
                  onTap: () => navigateToStage(context, index),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: kDefaultPadding),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: stageCompletionStatus[index]
                          ? Colors.green.withValues(alpha: 0.3)
                          : Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        appLevels[widget.levelIndex].stages[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: stageCompletionStatus[index]
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : null,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
