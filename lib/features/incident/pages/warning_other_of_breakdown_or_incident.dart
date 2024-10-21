import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/incident/pages/safety_in_tunnel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningOtherOfBreakdownOrIncident extends StatefulWidget {
  const WarningOtherOfBreakdownOrIncident({super.key});

  @override
  State<WarningOtherOfBreakdownOrIncident> createState() =>
      _WarningOtherOfBreakdownOrIncidentState();
}

class _WarningOtherOfBreakdownOrIncidentState
    extends State<WarningOtherOfBreakdownOrIncident> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Warning Other of Breakdown Or Incident",
          style: GoogleFonts.roboto(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createHeadingText("Warning others of a breakdown or incident"),
              SizedBox(
                height: 10,
              ),
              buildImage("https://via.placeholder.com/400"),
              SizedBox(
                height: 10,
              ),
              createAutoSizeText("Use your hazard warning lights"),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildBulletText(
                        "if you need to suddenly slow down or stop on a motorway or unrestricted dual carriageway because of an incident or hazard ahead; as soon as the traffic behind you has reacted to your hazard lights, you should turn them off"),
                    buildBulletText(
                        "when your vehicle has broken down and is temporarily obstructing traffic."),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              buildTipWidget(
                  "If you’re driving on a motorway and you see something fall from another vehicle, or if anything falls from your own vehicle, stop at the next emergency telephone and report the hazard. Don’t try to retrieve it yourself."),
              SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SafetyInTunnel()),
                  );
                },
                child: Center(
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
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

  AutoSizeText createAutoSizeText(String text,
      {double fontSize = 14, Color color = Colors.black87}) {
    return AutoSizeText(
      text,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        color: color,
      ),
      // Set the maximum number of lines
      minFontSize: 8, // Set the minimum font size
      overflow: TextOverflow.clip, // Handle overflow with ellipsis
    );
  }

  AutoSizeText createHeadingText(String heading,
      {double fontSize = 24, Color color = Colors.green}) {
    return AutoSizeText(
      heading,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold, // Make the heading bold
        color: color,
      ),
      maxLines: 1, // Typically, headings are one line
      minFontSize: 16, // Set a minimum font size
      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
    );
  }

  Widget buildTipWidget(String paragraphText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row containing the thumb icon and "Tip" text
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.thumb_up, size: 24.0, color: Colors.green),
            SizedBox(width: 8.0), // Space between icon and text
            Text(
              'Tip',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0), // Space between the tip and the paragraph
        // Paragraph text
        Text(
          paragraphText,
          style: GoogleFonts.roboto(fontSize: 13.0),
        ),
      ],
    );
  }

  Widget buildBulletText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bullet point (a simple dot)
        Container(
          margin: const EdgeInsets.only(top: 6.0), // Align bullet with text
          child: const Icon(
            Icons.fiber_manual_record, // Use a dot icon for the bullet
            size: 10.0,
            color: Colors.green,
          ),
        ),
        SizedBox(width: 8.0), // Space between bullet and text
        // Text next to the bullet
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.roboto(fontSize: 14.0),
          ),
        ),
      ],
    );
  }

  Widget buildImage(String imagePath,
      {double width = 100, double height = 100}) {
    return Image.network(
      imagePath,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover, // Adjust how the image fits in the box
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey, // Placeholder color in case of an error
          child: const Center(
              child: Text('Image not found',
                  style: TextStyle(color: Colors.white))),
        );
      },
    );
  }
}
