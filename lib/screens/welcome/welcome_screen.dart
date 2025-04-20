import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
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
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Lets Start Quiz",
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
