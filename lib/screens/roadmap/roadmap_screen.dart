import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/stage/stage_screen.dart';

class RoadmapScreen extends StatelessWidget {
  final List<String> chapters = [
    'இன்னா செய்யாமை',
    'பொருள் (அருளுடைமை)',
    'வாய்மை',
    'பண்புடைமை',
    'கல்வி',
    'அன்புடைமை',
    'வான்சிறப்பு',
    'செய்நன்றி அறிதல்',
    'காலம் அறிதல்',
    'இனியவை கூறல்',
  ];

  final List<String> stages = [
    'திருக்குறள்',
    'வீடியோ',
    'படங்கள்',
    'வினாடி வினா',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "கற்றல் பாதை",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: chapters.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Get.to(() => StageScreen(
                            levelIndex: index,
                            levelName: chapters[index],
                          )),
                      child: Container(
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: chapters.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Get.to(
                        () => StageScreen(
                          levelIndex: index,
                          levelName: chapters[index],
                          level: stages[index],
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
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
                          ],
                        ),
                      ),
                    ),
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
