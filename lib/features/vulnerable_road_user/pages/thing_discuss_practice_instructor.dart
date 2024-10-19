import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../category.dart';

class ThingDiscussPracticeInstructor extends StatefulWidget {
  const ThingDiscussPracticeInstructor({super.key});

  @override
  State<ThingDiscussPracticeInstructor> createState() =>
      _ThingDiscussPracticeInstructorState();
}

class _ThingDiscussPracticeInstructorState
    extends State<ThingDiscussPracticeInstructor> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thing Discuss Practice Instructor",
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
                "These are just a few examples of what you could discuss and practise with your instructor. Read more about vulnerable road users to come up with your own ideas.",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "Discuss with your instructor",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
                ),
              ),
              SizedBox(height: 20),
              AutoSizeText(
                "${bullet} which sticks are used by people with different disabilities; for example, a white stick with a red band",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "${bullet} the times when motorcyclists may be particularly vulnerable and how you should behave towards them",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "${bullet} what you think a cyclist’s experience of driving through traffic may be. How can you make them feel safer?",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              AutoSizeText(
                "Practise with your instructor",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
                ),
              ),
              SizedBox(height: 20),
              AutoSizeText(
                "${bullet} driving near schools at times when students and parents are likely to be arriving or leaving",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "${bullet} driving down country lanes where you may encounter horse riders or pedestrians walking along the road",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "${bullet} identifying the signs warning you of vulnerable road users, e.g., a red triangle with a picture of a bicycle",
                style: GoogleFonts.roboto(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Category(),
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
                          "Return",
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
