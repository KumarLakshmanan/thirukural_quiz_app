import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/Questions.dart';

class ThirukuralScreen extends StatefulWidget {
  final StageModel stage;

  const ThirukuralScreen({
    Key? key,
    required this.stage,
  }) : super(key: key);

  @override
  State<ThirukuralScreen> createState() => _ThirukuralScreenState();
}

class _ThirukuralScreenState extends State<ThirukuralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('திருக்குறள்', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.orange,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage:
                          AssetImage("assets/icons/thiruvalluvar.png"),
                    ),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      widget.stage.kural!,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "விளக்கம்: ${widget.stage.explanation!}",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: StatefulBuilder(
        builder: (context, setState) {
          final player = AudioPlayer();
          bool isPlaying = false;

          return FloatingActionButton(
            onPressed: () async {
              if (isPlaying) {
                await player.pause();
              } else {
                await player.setAudioSource(AudioSource.asset(
                  'assets/audio/${widget.stage.level}.mp3',
                ));
                await player.play();
              }
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: Builder(
              builder: (context) {
                return Icon(isPlaying ? Icons.pause : Icons.play_arrow);
              },
            ),
            backgroundColor: Colors.orange,
          );
        },
      ),
    );
  }
}
