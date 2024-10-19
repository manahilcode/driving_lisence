import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/vunerable_road_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: Text(
          "Introduction",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset("assets/L.png"),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(
                  "In this section, you’ll learn about",
                  Colors.green[800]!,
                ),
                _buildBulletPoint(
                  "who is particularly vulnerable on the road",
                  Colors.blue[800]!,
                ),
                _buildBulletPoint(
                  "how to help keep other road users safe.",
                  Colors.red[800]!,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to the next screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VulnerableRoadUser()),
                );
              },
              child: Container(
                width: 300,
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 30.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: GoogleFonts.roboto(
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
    );
  }

  // Helper method to build bullet points with styling
  Widget _buildBulletPoint(String text, Color bulletColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          // Bullet symbol with color
          Text(
            "\u2022", // Unicode for bullet symbol
            style: TextStyle(
              fontSize: 30, // Make the bullet larger
              color: Colors.green[700], // Customize the color
              height: 1.2, // Adjust height to align bullet with text
            ),
          ),
          const SizedBox(width: 10),
          // Bullet text
          Expanded(
            child: AutoSizeText(
              text,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              minFontSize: 14,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

