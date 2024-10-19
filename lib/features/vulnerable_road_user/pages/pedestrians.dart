import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'children.dart';

class Pedestrians extends StatefulWidget {
  const Pedestrians({super.key});

  @override
  State<Pedestrians> createState() => _PedestriansState();
}

class _PedestriansState extends State<Pedestrians> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pedestrians",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image at the top
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/L.png",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Main content
              AutoSizeText(
                "People walking on or beside the road – pedestrians – are vulnerable because they move more slowly than other road users and have no protection if they’re involved in a collision. Everybody is a pedestrian at some time, but not every pedestrian has the understanding of how to use roads safely.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 20),

              AutoSizeText(
                "Pedestrians normally use a pavement or footpath. Take extra care if they have to walk in the road – for example, when the pavement is closed for repairs or on country roads where there’s no pavement. Always check for road signs that indicate people may be walking in the road.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 20),

              AutoSizeText(
                "On country roads, it’s usually safest for pedestrians to walk on the right-hand side of the road, so that they’re facing oncoming traffic and can see the vehicles approaching.",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 20),

              AutoSizeText(
                "A large group of people, such as those on an organised walk, may walk on the left-hand side. At night, the person at the front of the group should show a white light while the person at the back of the group should show a bright red light to help approaching drivers to see them.",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      "Watch out for pedestrians already crossing when you’re turning into a side road. They have priority, so allow them to finish crossing.",
                      style: GoogleFonts.roboto(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    "assets/L.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Pedestrian crossings section
              AutoSizeText(
                "Pedestrian Crossings",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              AutoSizeText(
                "Pedestrian crossings allow people to cross the road safely. Be ready to slow down and stop as you approach them. Make sure you know how different types of crossing work.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 20),

              AutoSizeText(
                "Remember that you should never park on or near a pedestrian crossing, for example, on the zigzag lines either side of a zebra crossing.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Tips section
              AutoSizeText(
                "Tips",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              AutoSizeText(
                "Look for tell-tale signs that someone is going to cross the road between parked cars, such as:",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 10),

              AutoSizeText(
                "$bullet seeing their feet when looking between the wheels of the parked cars",
                style: GoogleFonts.roboto(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              AutoSizeText(
                "$bullet a ball bouncing out into the road",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              AutoSizeText(
                "$bullet a bicycle wheel sticking out between cars.",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 30),

              // Call-to-action button
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Children(),
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
                      borderRadius: BorderRadius.circular(12.0),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
