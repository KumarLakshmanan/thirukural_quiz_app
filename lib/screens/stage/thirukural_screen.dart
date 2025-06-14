import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Text(
          'திருக்குறள்',
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
                    'நிலை ${widget.stage.level}',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kTextSecondaryColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'இந்த திருக்குறளை படித்து கற்றுக்கொள்ளுங்கள்',
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
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                        boxShadow: kCardShadow,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: kPrimaryGradient,
                              boxShadow: kElevatedShadow,
                            ),
                            padding: EdgeInsets.all(4),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/icons/thiruvalluvar.png"),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          Container(
                            padding: EdgeInsets.all(kSmallPadding),
                            decoration: BoxDecoration(
                              color: kSurfaceColor,
                              borderRadius: BorderRadius.circular(kSmallRadius),
                            ),
                            child: Text(
                              widget.stage.kural!,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kTextPrimaryColor,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(kSmallPadding),
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(kSmallRadius),
                              border: Border.all(
                                color: kPrimaryColor.withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "விளக்கம்:",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  widget.stage.explanation!,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kTextPrimaryColor,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    _buildAudioPlayer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }  Widget _buildAudioPlayer() {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(kDefaultRadius),
        boxShadow: kCardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ஒலி பதிவு',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kTextPrimaryColor,
            ),
          ),
          SizedBox(height: kSmallPadding),
          Text(
            'இந்த திருக்குறளை சரியாக உச்சரிக்க ஒலிப்பதிவைக் கேளுங்கள்',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kTextSecondaryColor,
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              gradient: _isAudioInitialized ? kPrimaryGradient : null,
              color: _isAudioInitialized ? null : kGrayColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(kDefaultRadius),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _isAudioInitialized
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
                borderRadius: BorderRadius.circular(kDefaultRadius),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_isAudioInitialized)
                        Icon(
                          isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 28,
                        )
                      else
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(kGrayColor),
                            strokeWidth: 2,
                          ),
                        ),
                      SizedBox(width: kSmallPadding),
                      Text(
                        _isAudioInitialized
                            ? (isPlaying ? 'நிறுத்து' : 'கேள்')
                            : 'ஒலிப்பதிவு ஏற்றப்படுகிறது...',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _isAudioInitialized
                              ? Colors.white
                              : kTextSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
