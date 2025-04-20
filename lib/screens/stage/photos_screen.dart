import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(stage.title, style: TextStyle(color: Colors.white)),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stage.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Expanded(
                    child: ListView.builder(
                      itemCount: stage.images!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreenImage(
                                  imageUrl: stage.images![index]['url'] ??
                                      'assets/icons/thiruvalluvar.png',
                                ),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.white.withOpacity(0.2),
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Image.asset(
                                  stage.images![index]['url'] ??
                                      'assets/icons/thiruvalluvar.png',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(10),
                                  title: Text(
                                    stage.images![index]['title'] ??
                                        'Photo ${index + 1}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    stage.images![index]['description'] ??
                                        'Description for photo ${index + 1}',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Full Screen Image'),
      ),
      body: InteractiveViewer(
        panEnabled: true,
        boundaryMargin: EdgeInsets.all(20),
        minScale: 0.5,
        maxScale: 4.0,
        child: Container(
          height: double.infinity,
          child: Image.asset(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
