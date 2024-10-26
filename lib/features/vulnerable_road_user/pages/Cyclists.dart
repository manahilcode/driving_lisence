import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'motorcycle.dart';

class Cyclists extends StatefulWidget {
  const Cyclists({super.key});

  @override
  State<Cyclists> createState() => _CyclistsState();
}

class _CyclistsState extends State<Cyclists> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title:  Text("Cyclists",style: GoogleFonts.roboto(
            color: Colors.white
        )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Cycle routes",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/L.png",height: 100,),
              const SizedBox(
                height: 05,
              ),
              const AutoSizeText(
                  "In some areas there may be special cycle or shared cycle and pedestrian routes, which are marked by signs."),
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/L.png",
              height: 100,),
              const SizedBox(
                height: 05,
              ),
              AutoSizeText("At traffic lights, advanced stop lines are sometimes marked on the road so that cyclists can stop in front of other traffic. When the lights are red or about to become red, you should stop at the first white line."),

              SizedBox(
                height: 10,
              ),

              AutoSizeText("Overtaking cyclists",style: GoogleFonts.roboto(fontWeight: FontWeight.bold),),
           SizedBox(
             height: 10,
           ),

              AutoSizeText("If you’re overtaking a cyclist, give them as much room as you would a car. They may swerve"),
              AutoSizeText("${bullet} to avoid an uneven road surface"),
              AutoSizeText("${bullet} to avoid an uneven road surface"),

              AutoSizeText("A cyclist travelling at a low speed, or glancing over their shoulder to check for traffic, may be planning to turn right. Stay behind and give them plenty of room."),
              SizedBox(
                height: 10,
              ),
              AutoSizeText("Never overtake a slow-moving vehicle just before you turn left. Hold back and wait until it has passed the junction before you turn."),
          SizedBox(
            height: 10,
          ),
              AutoSizeText("Cyclists at junctions",style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: 10,
              ),
              AutoSizeText("When you’re emerging from a junction, look carefully for cyclists. They’re not as easy to see as larger vehicles. Also look out for cyclists emerging from junctions."),
              AutoSizeText("Be aware of cyclists at a roundabout. They may decide to stay in the left-hand lane, whichever direction they’re planning to take. Hold back and give them plenty of room.",style: GoogleFonts.roboto(),),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    //   Navigate to the next tip or page
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Motorcycle(),
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
