import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/thing_discuss_practice_instructor.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/think_about.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeetingTheStandard extends StatefulWidget {
  const MeetingTheStandard({super.key});

  @override
  State<MeetingTheStandard> createState() => _MeetingTheStandardState();
}

class _MeetingTheStandardState extends State<MeetingTheStandard> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meeting the Standard",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You must be able to",
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Heading color green
                ),
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "• Look out for the effect of starting your engine near vulnerable road users. Passing cyclists or pedestrians may be affected.",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              SizedBox(height: 6),
              AutoSizeText(
                "• Look for vulnerable road users at junctions, roundabouts, and crossings. For example:",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              SizedBox(height: 6),
              AutoSizeText("$bullet Cyclists", style: GoogleFonts.roboto(fontSize: 18)),
              AutoSizeText("$bullet Motorcyclists", style: GoogleFonts.roboto(fontSize: 18)),
              AutoSizeText("$bullet Horse riders", style: GoogleFonts.roboto(fontSize: 18)),

              SizedBox(height: 20),
              Text(
                "You must know and understand",
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Heading color green
                ),
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "$bullet When other road users are vulnerable and how to allow for them.",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              SizedBox(height: 6),
              AutoSizeText(
                "$bullet The rules that apply to vulnerable road users, like cyclists and motorcyclists, and the position that they may select on the road as a result.",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              SizedBox(height: 6),
              AutoSizeText(
                "$bullet How vulnerable road users may act on the road. For example:",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              SizedBox(height: 6),
              AutoSizeText("$bullet Cyclists may wobble", style: GoogleFonts.roboto(fontSize: 18)),
              AutoSizeText("$bullet Children may run out", style: GoogleFonts.roboto(fontSize: 18)),
              AutoSizeText(
                "$bullet Older people may take longer to cross the road.",
                style: GoogleFonts.roboto(fontSize: 18),
              ),

              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThinkAbout(),
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
