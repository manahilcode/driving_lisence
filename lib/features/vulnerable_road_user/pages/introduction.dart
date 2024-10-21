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
        backgroundColor: Colors.green,
        title:  Text("Introduction",style: GoogleFonts.roboto(
            color: Colors.white
        )),
      ),
      body: Column(
        children: [
          Expanded(

              child: Image.asset("assets/L.png")),
          const Expanded(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AutoSizeText(" ○ In this section, you’ll learn about"),
                AutoSizeText(" ○ who is particularly vulnerable on the road"),
                AutoSizeText(" ○ how to help keep other road users safe."),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to the next tip or page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VulnerableRoadUser()), // Change this
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
    );
  }
}
