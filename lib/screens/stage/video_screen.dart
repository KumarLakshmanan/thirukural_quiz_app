import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';

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
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    final cacheDir = await getTemporaryDirectory();
    final videoFile = File('${cacheDir.path}/${widget.stage.level}.mp4');

    if (!await videoFile.exists()) {
      final videoUrl =
          "https://codingfrontend.in/assets/thirukural/video/${widget.stage.level}.mp4";
      final response = await http.get(Uri.parse(videoUrl));

      if (response.statusCode == 200) {
        await videoFile.writeAsBytes(response.bodyBytes);
      } else {
        return;
      }
    }

    _videoPlayerController = VideoPlayerController.file(videoFile)
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController,
            looping: true,
            autoPlay: false,
            aspectRatio: 16 / 9,
            allowPlaybackSpeedChanging: true,
            allowFullScreen: true,
            materialProgressColors: ChewieProgressColors(
              playedColor: kPrimaryColor,
              handleColor: kAccentColor,
              backgroundColor: kGrayColor.withOpacity(0.2),
              bufferedColor: kPrimaryColor.withOpacity(0.3),
            ),
            placeholder: Container(
              color: kSurfaceColor,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                ),
              ),
            ),
            errorBuilder: (context, errorMessage) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      color: kErrorColor,
                      size: 48,
                    ),
                    SizedBox(height: kSmallPadding),
                    Text(
                      'Video could not be loaded',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kTextPrimaryColor,
                      ),
                    ),
                  ],
                ),
              );
            },
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
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Text(
          widget.stage.title,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kTextPrimaryColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: kTextPrimaryColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: kCardColor,
                boxShadow: kCardShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'வீடியோ பாடம்',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kTextSecondaryColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'இந்த கதையை கவனமாக பாருங்கள்',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kTextPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                    boxShadow: kCardShadow,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: _isVideoInitialized
                      ? Chewie(controller: _chewieController!)
                      : Container(
                          width: double.infinity,
                          height: 200,
                          color: kSurfaceColor,
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
