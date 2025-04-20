import 'package:flutter/material.dart';

import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoScreen extends StatefulWidget {
  final StageModel stage;

  const VideoScreen({
    Key? key,
    required this.stage,
  }) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      "assets/video/1.mp4",
    )..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController,
            looping: true,
            autoPlay: false,
          );
        });
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.stage.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(height: kDefaultPadding),
                Expanded(
                  child: Center(
                    child: LayoutBuilder(builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxWidth * 9 / 16,
                        child: _isVideoInitialized
                            ? Chewie(controller: _chewieController!)
                            : CircularProgressIndicator(),
                      );
                    }),
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
