import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/pedestrians.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VunerableRoadUserTest extends StatefulWidget {
  const VunerableRoadUserTest({super.key});

  @override
  State<VunerableRoadUserTest> createState() => _VunerableRoadUserTestState();
}

class _VunerableRoadUserTestState extends State<VunerableRoadUserTest> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";

    return Scaffold(
      appBar: AppBar(
        title:  Text("Vulnerable Quiz",style: GoogleFonts.roboto(
            color: Colors.white
        )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,

      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            const AutoSizeText(
                "What should you do when you see a vulnerable person about to cross the road ahead?",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(" ${bullet} Option 1"),
            ),
            ListTile(
              title: Text(" ${bullet} Option 2"),
            ),
            ListTile(
              title: Text(" ${bullet} Option 3"),
            ),
            ListTile(
              title: Text(" ${bullet} Option 4"),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the next tip or page
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PedestriansVulnerable(),
                    ),
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );
                },
                child: Center(
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
