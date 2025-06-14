import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/Questions.dart';

class PhotosScreen extends StatelessWidget {
  final StageModel stage;

  const PhotosScreen({
    Key? key,
    required this.stage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Text(
          stage.title,
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
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: ListView.builder(
            itemCount: stage.images!.length,
            itemBuilder: (context, index) {
              final imageItem = stage.images![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl: imageItem['url'] ?? 'assets/icons/thiruvalluvar.png',
                        title: imageItem['title'] ?? '',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: kDefaultPadding),
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                    boxShadow: kCardShadow,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(kDefaultRadius),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: "https://codingfrontend.in/assets/thirukural/" + 
                                    (imageItem['url'] ?? ""),
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                height: 200,
                                alignment: Alignment.center,
                                color: kSurfaceColor,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: 200,
                                alignment: Alignment.center,
                                color: kSurfaceColor,
                                child: Icon(Icons.error_outline_rounded, 
                                  color: kErrorColor,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(kSmallRadius),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.fullscreen_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                padding: EdgeInsets.all(8),
                                constraints: BoxConstraints(),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullScreenImage(
                                        imageUrl: imageItem['url'] ?? 
                                            'assets/icons/thiruvalluvar.png',
                                        title: imageItem['title'] ?? '',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              imageItem['title'] ?? "",
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kTextPrimaryColor,
                              ),
                            ),
                            SizedBox(height: kSmallPadding / 2),
                            Text(
                              imageItem['explanation'] ?? "",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: kTextSecondaryColor,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: kSmallPadding),
                            Container(
                              padding: EdgeInsets.all(kSmallPadding),
                              decoration: BoxDecoration(
                                color: kSurfaceColor,
                                borderRadius: BorderRadius.circular(kSmallRadius),
                                border: Border.all(
                                  color: kGrayColor.withOpacity(0.2),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.info_outline_rounded,
                                    color: kAccentColor,
                                    size: 18,
                                  ),
                                  SizedBox(width: kSmallPadding),
                                  Expanded(
                                    child: Text(
                                      imageItem['image_description'] ?? "",
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: kTextSecondaryColor,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const FullScreenImage({
    Key? key, 
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 4.0,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: "https://codingfrontend.in/assets/thirukural/" + imageUrl,
              fit: BoxFit.contain,
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                ),
              ),
              errorWidget: (context, url, error) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline_rounded, color: kErrorColor, size: 48),
                  SizedBox(height: kSmallPadding),
                  Text(
                    'Image not found',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
