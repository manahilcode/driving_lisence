import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Cyclists.dart';

class OlderDisabledPedistrains extends StatefulWidget {
  const OlderDisabledPedistrains({super.key});

  @override
  State<OlderDisabledPedistrains> createState() =>
      _OlderDisabledPedistrainsState();
}

class _OlderDisabledPedistrainsState extends State<OlderDisabledPedistrains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Older and disabled pedestrians",style: GoogleFonts.roboto(
            color: Colors.white
        )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              "assets/L.png",
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            const AutoSizeText(
                "If you see older people about to cross the road ahead, be careful as they may have misjudged your speed."),
            const AutoSizeText(
                "If they’re crossing, be patient and allow them to cross in their own time: they may need extra time to cross the road."),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/L.png",
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            const AutoSizeText(
                "A pedestrian with hearing difficulties may have a dog with a distinctive yellow or burgundy coloured coat."),
            const AutoSizeText(
                "A person carrying a white stick with a red band is both deaf and blind. They may also have a guide dog with a red and white checked harness."),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the next tip or page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Cyclists()), // Change this
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
