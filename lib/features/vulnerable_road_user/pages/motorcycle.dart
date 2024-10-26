import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animals.dart';

class Motorcycle extends StatefulWidget {
  const Motorcycle({super.key});

  @override
  State<Motorcycle> createState() => _MotorcycleState();
}

class _MotorcycleState extends State<Motorcycle> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";

    return Scaffold(
      appBar: AppBar(
        title:  Text("Motorcyclists",style: GoogleFonts.roboto(
            color: Colors.white
        )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(
                  "Motorcyclists can be hard to see because their vehicles are smaller than cars. They’re usually fast-moving too, so they can be very vulnerable in a collision."),
              const SizedBox(
                height: 20,
              ),
              const AutoSizeText(
                  "Remember to leave enough room while overtaking a motorcycle; the rider may swerve to avoid an uneven surface or be affected by a gust of wind. Look carefully for motorcyclists at junctions too, as they may be easily hidden by other vehicles, street furniture or other roadside features, such as trees."),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                "assets/L.png",
                height: 100,
              ),
              const AutoSizeText(
                  "When you’re moving in queues of traffic, be aware that motorcyclists may"),
              const SizedBox(
                height: 05,
              ),
              AutoSizeText("${bullet} filter between lanes"),
              AutoSizeText("${bullet} cut in just in front of you"),
              AutoSizeText("${bullet} pass very close to you."),
              const SizedBox(
                height: 20,
              ),
              AutoSizeText(
                "Lane",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const AutoSizeText(
                  "Is normally a narrow road. They may be found in urban and rural areas."
                  "Traffic lanes are where the road is divided into lanes by road markings. These are used for traffic control and to help navigation."),
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText(
                  "Check your mirrors for motorcycles approaching from behind and give them space if possible."),
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText(
                  "If there’s a slow-moving motorcyclist ahead and you’re not sure what the rider is going to do, stay behind them in case they change direction suddenly."),
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText(
                  "To improve their visibility, motorcyclists often wear bright clothing and ride with dipped headlights, even during the day."),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/L.png",
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText(
                  "Motorcyclists also wear safety equipment, such as a helmet, to protect themselves. If there’s been an accident and you find a motorcyclist has been injured, get medical assistance. Don’t remove their helmet unless it’s essential."),
              AutoSizeText(
                "Tips",
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText(
                  "If you have a collision, you MUST stop. By law, you MUST stop at the scene of the incident if damage or injury is caused to any other person, vehicle, animal or property."),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the next tip or page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Animals()), // Change this
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
