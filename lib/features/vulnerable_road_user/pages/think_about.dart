import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/thing_discuss_practice_instructor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThinkAbout extends StatefulWidget {
  const ThinkAbout({super.key});

  @override
  State<ThinkAbout> createState() => _ThinkAboutState();
}

class _ThinkAboutState extends State<ThinkAbout> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Think About",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "${bullet} Which types of pedestrian crossing might you see, and what are the differences between them?",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "${bullet} When might you need to watch out for children near the road?",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "${bullet} Which disability might a person have if they’re walking with a dog that has a red and white checked harness?",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "${bullet} What might a cyclist or motorcyclist be about to do if they’re checking over their shoulder?",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "${bullet} What mustn’t you do when driving near horses or other animals on the road?",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const ThingDiscussPracticeInstructor(),
                      ),
                          (Route<dynamic> route) => false,
                    );
                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
