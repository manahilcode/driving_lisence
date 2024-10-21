import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'breakdown.dart';

class IncidentAccidentAndEmergency extends StatefulWidget {
  const IncidentAccidentAndEmergency({super.key});

  @override
  _IncidentAccidentAndEmergencyState createState() =>
      _IncidentAccidentAndEmergencyState();
}

class _IncidentAccidentAndEmergencyState
    extends State<IncidentAccidentAndEmergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Incident Accident, and Emergency',
            style: GoogleFonts.roboto(
              color: Colors.white
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Emergency Preparedness',
              style: GoogleFonts.roboto(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                  color: Colors.green
              ),
            ),
            const SizedBox(height: 16.0),
            // Paragraph
            Text(
              'In this section, you’ll learn about',
              style: GoogleFonts.roboto(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Image.network(
              'https://via.placeholder.com/400', // Placeholder image URL
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                 border: Border.all(color: Colors.green),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BulletPoint(text: 'what to do if your car breaks down'),
                  BulletPoint(text: 'how to drive safely in a tunnel, and what to do if you have an emergency'),
                  BulletPoint(text: 'what to do if you’re the first to arrive at an incident'),
                  BulletPoint(
                      text: 'first aid and how to help casualties at an incident'),
                  BulletPoint(
                      text: 'reporting an incident to the police.t'),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            // Image

            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>const Breakdowns()),
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
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(Icons.brightness_1, size: 8.0),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.roboto(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
