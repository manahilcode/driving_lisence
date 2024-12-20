import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'motorcycle/hazard/pages/hazard_screen.dart';
import 'motorcycle/hazard/pages/static_hazard_screen.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green), // Added icon
                title: Text("Introduction", style: TextStyle(fontWeight: FontWeight.bold),), // Bold text
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return MotorCycleHazardScreen();
                      }));
                },
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("static_hazard",style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                 //StaticHazardScreen
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("Road_and_weather_conditions",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),

                onTap: (){
                  //RoadWeatherConditionScreen
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },

              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("Yourself",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  //YourselfScreen
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("Factor-Effecting",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  //FactorEffecting
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("Learning-to-see-screen",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  //LearningToSeeHazard

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("Looking-but-no-seeing",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                //  LookingButNoSeeingScreenLookingButNoSeeingScreen
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("scanning",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                 // ScanningScreen
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("Seeing-hazard",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  // SeeingHazardScreen
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("hazard-management",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: ()
                {
                  //HazardManagment
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("responding-to-hazard",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  //RespondingToHazard
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("reviewing-your-hazard",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  //ReviewingYourHazard
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            /////
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("Clue",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  //ClueScreen
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("UnderStand Hazard",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  //UnderstandingHazardScreen
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());
                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("what If",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  //WhatIfScreen
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            ////
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("Hazard-quiz",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: ()
                {
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text("Hazard-Response-clip",style: TextStyle(fontWeight: FontWeight.bold)),
                tileColor: Colors.grey[200], // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: (){
                  Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
