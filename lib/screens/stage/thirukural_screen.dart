import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

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
  late AudioPlayer player;
  bool isPlaying = false;
  bool _isAudioInitialized = false;
  File? _audioFile;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    final cacheDir = await getTemporaryDirectory();
    final audioFile = File('${cacheDir.path}/${widget.stage.level}.mp3');

    if (!await audioFile.exists()) {
      final audioUrl =
          "https://codingfrontend.in/assets/thirukural/audio/${widget.stage.level}.mp3";
      final response = await http.get(Uri.parse(audioUrl));

      if (response.statusCode == 200) {
        await audioFile.writeAsBytes(response.bodyBytes);
      } else {
        return;
      }
    }

    setState(() {
      _audioFile = audioFile;
      _isAudioInitialized = true;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: _isAudioInitialized
            ? () async {
                if (isPlaying) {
                  setState(() {
                    isPlaying = false;
                  });
                  await player.pause();
                } else {
                  await player
                      .setAudioSource(AudioSource.file(_audioFile!.path));
                  setState(() {
                    isPlaying = true;
                  });
                  await player.play();
                }
              }
            : null,
        child: _isAudioInitialized
            ? Icon(isPlaying ? Icons.pause : Icons.play_arrow)
            : CircularProgressIndicator(
                color: Colors.white,
              ),
        backgroundColor: _isAudioInitialized ? Colors.orange : Colors.grey,
      ),
    );
  }
}
