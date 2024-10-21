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
        title:  Text("Pedestrians",style: GoogleFonts.roboto(
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
              Image.asset(
                "assets/L.png",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              const AutoSizeText(
                "People walking on or beside the road – pedestrians – are vulnerable because they move more slowly than other road users and have no protection if they’re involved in a collision. Everybody is a pedestrian at some time, but not every pedestrian has the understanding of how to use roads safely.",
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const AutoSizeText(
                "Pedestrians normally use a pavement or footpath. Take extra care if they have to walk in the road – for example, when the pavement is closed for repairs or on country roads where there’s no pavement. Always check for road signs that indicate people may be walking in the road.",
                textAlign: TextAlign.justify,
              ),
              const AutoSizeText(
                  "On country roads, it’s usually safest for pedestrians to walk on the right-hand side of the road, so that they’re facing oncoming traffic and can see the vehicles approaching."),
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText(
                  "A large group of people, such as those on an organised walk, may walk on the left-hand side. At night, the person at the front of the group should show a white light while the person at the back of the group should show a bright red light to help approaching drivers to see them."),
              const SizedBox(
                height: 05,
              ),
              Row(
                children: [
                  const Expanded(
                      child: AutoSizeText(
                          "Watch out for pedestrians already crossing when you’re turning into a side road. They have priority, so allow them to finish crossing.")),
                  Image.asset(
                    "assets/L.png",
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ],
              ),


              const AutoSizeText("Pedestrian crossings",style: TextStyle(

                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              const AutoSizeText("Pedestrian crossings allow people to cross the road safely: be ready to slow down and stop as you approach them. Make sure you know how different types of crossing work. See section 2, Attitude, for more details."),
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText("Remember that you should never park on or near a pedestrian crossing; for example, on the zigzag lines either side of a zebra crossing."),
              const SizedBox(
                height: 10,
              ),
              
              
              AutoSizeText("Tips",style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold
              ),
              ),
              
              AutoSizeText("Look for tell-tale signs that someone is going to cross the road between parked cars, such as",style:
                GoogleFonts.roboto(),),
              AutoSizeText(" ${bullet} seeing their feet when looking between the wheels of the parked cars",style:
              GoogleFonts.roboto(),textAlign:TextAlign.justify ,),
              AutoSizeText(" ${bullet} a ball bouncing out into the road",style:
              GoogleFonts.roboto(),),
              AutoSizeText(" ${bullet} a bicycle wheel sticking out between cars.",style:
              GoogleFonts.roboto(),),
               SizedBox(
                 height: 20,
               ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                 //   Navigate to the next tip or page
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Children(),
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
