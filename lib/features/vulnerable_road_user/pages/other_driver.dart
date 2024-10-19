import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/Meeting_the_standard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherDriver extends StatefulWidget {
  const OtherDriver({super.key});

  @override
  State<OtherDriver> createState() => _OtherDriverState();
}

class _OtherDriverState extends State<OtherDriver> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Other Driver",
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Increased padding for better spacing
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/L.png"),
              const SizedBox(height: 20), // Added spacing
              const AutoSizeText(
                "Other drivers, especially those who are inexperienced or older, may not react as quickly as you to what’s happening on the road. Learner drivers may make mistakes, such as stalling at a junction. Be patient and be ready to slow down or stop if necessary.",
                style: TextStyle(fontSize: 16), // Adjusted font size for readability
              ),
              const SizedBox(height: 10), // Added spacing
              Text(
                "Tip",
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green), // Green heading
              ),
              const SizedBox(height: 10), // Added spacing
              const AutoSizeText(
                "A flashing amber beacon on the top of a vehicle means it’s a slow-moving vehicle. A powered wheelchair or mobility scooter MUST have a flashing amber light when travelling on a dual carriageway with a speed limit that exceeds 50 mph.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10), // Added spacing
              const AutoSizeText(
                "If you find another vehicle is following you too closely in fast-moving traffic, slow down gradually to increase your distance from the vehicle in front. This gives you more room to slow down gradually or stop if necessary, and so reduces the risk of the vehicle behind crashing into you because the driver hasn’t left enough room to stop safely.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20), // Added spacing
              Text(
                "Learner drivers and newly qualified drivers",
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green), // Green heading
              ),
              const SizedBox(height: 10), // Added spacing
              Text(
                "Anyone can teach you to drive providing they",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 10), // Added spacing
              Text("${bullet} are over 21", style: GoogleFonts.roboto(fontSize: 16)),
              Text("${bullet} have held, and still hold, a full licence for that category of vehicle for at least 3 years", style: GoogleFonts.roboto(fontSize: 16)),
              Text("${bullet} don’t charge – even petrol money – unless they’re an approved driving instructor (ADI).", style: GoogleFonts.roboto(fontSize: 16)),
              const SizedBox(height: 15), // Added spacing
              const AutoSizeText(
                "However, you’re strongly advised to take lessons with an ADI to make sure you’re taught the correct procedures from the start.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 15), // Added spacing
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the next tip or page
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MeetingTheStandard(),
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
