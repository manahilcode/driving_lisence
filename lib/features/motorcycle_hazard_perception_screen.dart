import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'motorcycle/hazard/pages/hazard_screen.dart';
import 'motorcycle/hazard/pages/hazard_seeing_screen/factor_effecting.dart';
import 'motorcycle/hazard/pages/hazard_seeing_screen/learning_to_see_screen.dart';
import 'motorcycle/hazard/pages/hazard_seeing_screen/looking_but_no_seeing_screen.dart';
import 'motorcycle/hazard/pages/hazard_seeing_screen/scanning_Screen.dart';
import 'motorcycle/hazard/pages/hazard_seeing_screen/seeing_hazard_screen.dart';
import 'motorcycle/hazard/pages/respond_hazard_screen/hazard_managment.dart';
import 'motorcycle/hazard/pages/respond_hazard_screen/responding_to_hazard.dart';
import 'motorcycle/hazard/pages/respond_hazard_screen/reviewing_your_hazard.dart';
import 'motorcycle/hazard/pages/road_weather_condition_screen.dart';
import 'motorcycle/hazard/pages/static_hazard_screen.dart';
import 'motorcycle/hazard/pages/understanding_hazard_screen/clue_screen.dart';
import 'motorcycle/hazard/pages/understanding_hazard_screen/understanding_hazard_screen.dart';
import 'motorcycle/hazard/pages/understanding_hazard_screen/what_if_screen.dart';
import 'motorcycle/hazard/pages/yourself_screen.dart';
import 'motorcycle/hazard_quiz/pages/hazard_question.dart';
import 'motorcycle/hazard_response_clip/pages/hazard_response_clip.dart';

class MotorcycleHazardPerceptionScreen extends StatefulWidget {
  const MotorcycleHazardPerceptionScreen({super.key});

  @override
  State<MotorcycleHazardPerceptionScreen> createState() =>
      _MotorcycleHazardPerceptionScreenState();
}

class _MotorcycleHazardPerceptionScreenState
    extends State<MotorcycleHazardPerceptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700, // Darker green for contrast
        title: Text(
          "Hazard Perception Motorcycle",
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Increased padding for spacing
        child: ListView(
          children: [
            buildListTile(
              title: "Introduction",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MotorCycleHazardScreen()),
                );
              },
            ),
            buildListTile(
              title: "Static Hazard",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StaticHazardScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Road and Weather Conditions",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RoadWeatherConditionScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Yourself",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const YourselfScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Factor Affecting",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FactorEffecting()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Learning to See",
              onTap: () {
                //LearningToSeeHazard
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LearningToSeeHazard()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Looking but Not Seeing",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LookingButNoSeeingScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Scanning",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScanningScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Seeing Hazard",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SeeingHazardScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Hazard Management",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HazardManagment()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Responding to Hazard",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RespondingToHazard()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Reviewing Your Hazard",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReviewingYourHazard()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Clue",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const ClueScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Understand Hazard",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UnderstandingHazardScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "What If",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const WhatIfScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Hazard Quiz",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HazardQuizPageView()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            buildListTile(
              title: "Hazard Response Clip",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VideoShowPageView()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.info, color: Colors.green.shade700),
        title: Text(
          title,
          style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        tileColor: Colors.white, // White background for contrast
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12), // Rounded corners for all items
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        onTap: onTap,
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.green.shade700),
      ),
    );
  }
}
