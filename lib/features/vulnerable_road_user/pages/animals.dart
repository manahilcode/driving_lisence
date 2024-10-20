import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/other_driver.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Animals extends StatefulWidget {
  const Animals({super.key});

  @override
  State<Animals> createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animals",
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Increased padding for better spacing
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/L.png",
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 20), // Added spacing
              const AutoSizeText(
                "Horses and other animals can behave in unpredictable ways on the road because they get frightened by the noise and speed of vehicles. Always drive carefully if there are animals on the road.",
                style: TextStyle(fontSize: 16), // Adjusted font size for readability
              ),
              const SizedBox(height: 10), // Added spacing
              AutoSizeText("${bullet} Stay well back.", style: TextStyle(fontSize: 16)),
              AutoSizeText("${bullet} Don’t rev your engine or sound your horn near horses as this may startle them.", style: TextStyle(fontSize: 16)),
              AutoSizeText("${bullet} Go very slowly and be ready to stop.", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20), // Added spacing
              const AutoSizeText(
                "When it’s safe to overtake",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green), // Green heading
              ),
              AutoSizeText("${bullet} drive past slowly", style: TextStyle(fontSize: 16)),
              AutoSizeText("${bullet} leave plenty of room.", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20), // Added spacing
              const AutoSizeText(
                "Take extra care when approaching a roundabout. Horse riders, like cyclists, may keep to the left, even if they’re signalling right. Stay well back.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20), // Added spacing
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the next tip or page
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtherDriver(),
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
      ),
    );
  }
}
