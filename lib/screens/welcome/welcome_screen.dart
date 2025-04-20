import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/roadmap/roadmap_screen.dart';
import 'package:quiz_app/services/shared_preferences_service.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController dobController = TextEditingController();
  String selectedGender = '';
  String selectedDisability = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    "வினாடி வினா விளையாடுவோம்,",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("உங்கள் தகவல்களை கீழே உள்ளிடவும்"),
                  const SizedBox(height: 20),

                  Text(
                    "முழு பெயர்",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "உங்கள் முழுப் பெயரை உள்ளிடவும்",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "பாலினம்",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    hint: Text(
                      "பாலினத்தைத் தேர்ந்தெடுக்கவும்",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(child: Text("ஆண்"), value: "ஆண்"),
                      DropdownMenuItem(child: Text("பெண்"), value: "பெண்"),
                      DropdownMenuItem(child: Text("மற்றவை"), value: "மற்றவை"),
                    ],
                    onChanged: (value) {
                      selectedGender = value ?? '';
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "பிறந்த தேதி",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFF1C2341),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            dobController.text.isEmpty
                                ? "பிறந்த தேதியைத் தேர்ந்தெடுக்கவும்"
                                : dobController.text,
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 10,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.calendar_today, color: Colors.white54),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "இயலாமை",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    hint: Text(
                      "உங்கள் இயலாமையைத் தேர்ந்தெடுக்கவும்",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text("அறிவாற்றல் குறைபாடு"),
                        value: "அறிவாற்றல் குறைபாடு",
                      ),
                      DropdownMenuItem(
                        child: Text("கேள்வி குறைபாடு"),
                        value: "கேள்வி குறைபாடு",
                      ),
                      DropdownMenuItem(
                        child: Text("காட்சி குறைபாடு"),
                        value: "காட்சி குறைபாடு",
                      ),
                      DropdownMenuItem(
                        child: Text("மற்றவைகள்"),
                        value: "மற்றவைகள்",
                      ),
                    ],
                    onChanged: (value) {
                      selectedDisability = value ?? '';
                    },
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      if (nameController.text.isEmpty ||
                          selectedGender.isEmpty ||
                          dobController.text.isEmpty ||
                          selectedDisability.isEmpty) {
                        Get.snackbar(
                          'எச்சரிக்கை',
                          'அனைத்து விவரங்களையும் பூர்த்தி செய்யவும்',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }

                      await SharedPreferencesService.saveUserDetails(
                        name: nameController.text,
                        gender: selectedGender,
                        dateOfBirth: dobController.text,
                        disability: selectedDisability,
                      );

                      Get.to(() => RoadmapScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "தொடங்குவோம்",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
