import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      "assets/video/1.mp4",
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      looping: true,
      autoPlay: false,
    );
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
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.stage.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Expanded(
                    child: Center(
                      child: _chewieController != null &&
                              _chewieController!.videoPlayerController.value
                                  .isInitialized
                          ? Chewie(controller: _chewieController!)
                          : Center(
                              child: CircularProgressIndicator(),
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
