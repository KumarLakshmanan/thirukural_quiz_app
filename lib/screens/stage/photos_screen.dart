import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/constants.dart';

class PhotosScreen extends StatelessWidget {
  final List<Map<String, String>> photos;
  final String title;

  const PhotosScreen({
    Key? key,
    required this.photos,
    required this.title,
  }) : super(key: key);

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
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Expanded(
                    child: ListView.builder(
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white.withValues(alpha: 0.2),
                          margin: EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: Image.network(
                              photos[index]['url'] ?? '',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              photos[index]['description'] ?? '',
                              style: TextStyle(color: Colors.white),
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