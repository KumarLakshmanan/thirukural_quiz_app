import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/screens/roadmap/roadmap_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/services/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isRegistered = await SharedPreferencesService.isRegistrationCompleted();
  runApp(MyApp(isRegistered: isRegistered));
}

class MyApp extends StatelessWidget {
  final bool isRegistered;

  const MyApp({Key? key, required this.isRegistered}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: isRegistered ? RoadmapScreen() : WelcomeScreen(),
    );
  }
}
