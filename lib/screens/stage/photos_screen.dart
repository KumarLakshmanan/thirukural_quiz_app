import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
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
                        return Card(
                          color: Colors.white.withValues(alpha: 0.2),
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Image.network(
                                'https://placehold.co/600x400',
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.all(10),
                                title: Text(
                                  stage.images![index]['title'] ?? 'Photo ${index + 1}',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  stage.images![index]['description'] ?? 'Description for photo ${index + 1}',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ],
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