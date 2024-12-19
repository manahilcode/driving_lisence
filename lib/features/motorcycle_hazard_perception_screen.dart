import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'motorcycle/hazard/pages/hazard_screen.dart';

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
        backgroundColor: Colors.green,
        title: Text(
          "Hazard Perception MotorCycle",
          style: GoogleFonts.roboto(),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Introduction"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MotorCycleHazardScreen();
              }));
            },
          ),
          ListTile(
            title: Text("static_hazard"),
          ),
          ListTile(
            title: Text("Road_and_weather_conditions"),
          ),
          ListTile(
            title: Text("Yourself"),
          ),
          ListTile(
            title: Text("Factor-Effecting"),
          ),
          ListTile(
            title: Text("Learning-to-see-screen"),
          ),
          ListTile(
            title: Text("Looking-but-no-seeing"),
          ),
          ListTile(
            title: Text("scanning"),
          ),
          ListTile(
            title: Text("Seeing-hazard"),
          ),
          ListTile(
            title: Text("hazard-management"),
          ),
          ListTile(
            title: Text("responding-to-hazard"),
          ),
          ListTile(
            title: Text("reviewing-your-hazard"),
          ),
          ListTile(
            title: Text("Hazard-quiz"),
          ),
          ListTile(
            title: Text("Hazard-Response-clip"),
          ),
        ],
      ),
    );
  }
}
