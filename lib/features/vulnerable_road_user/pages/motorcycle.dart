import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';
import 'animals.dart';

class Motorcycle extends StatefulWidget {
  const Motorcycle({super.key});

  @override
  State<Motorcycle> createState() => _MotorcycleState();
}

class _MotorcycleState extends State<Motorcycle> {
  VulnerableController? _vulnerableController;

  @override
  void didChangeDependencies() {
    _vulnerableController = Provider.of<VulnerableController>(context,listen: false);
    _vulnerableController?.fetchMotorcycle();
    super.didChangeDependencies();
  }

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
      body: Consumer<VulnerableController>(
        builder: (context,value,child) {
          final data  = value.motorcycle;
          if(data == null)
            {
              return Center(
                child: LoadingScreen(),
              );
            }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createHeadingText(data.title),
                  // const AutoSizeText(
                  //     ),
                  const SizedBox(
                    height: 20,
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: AutoSizeText(
                        data.subtitle),
                   ),
                  const SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Column(
                          children: [
                            createHeadingText("Definition"),
                            createAutoSizeText(data.definition),
                          ],
                        )),
                  ),
                  buildImage(data.image),


                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data.points[0]),
                        buildBulletText(data.points[1]),
                        buildBulletText(data.points[2]),
                        buildBulletText(data.points[3]),

                      ],
                    ),
                  ),
                  // const AutoSizeText(
                  //     "When you’re moving in queues of traffic, be aware that motorcyclists may"),
                  // const SizedBox(
                  //   height: 05,
                  // ),
                  // AutoSizeText("${bullet} filter between lanes"),
                  // AutoSizeText("${bullet} cut in just in front of you"),
                  // AutoSizeText("${bullet} pass very close to you."),
                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          createHeadingText(
                            "Lane",

                          ),
                          createAutoSizeText(data.lane),
                        ],
                      ),
                    ),
                  ),

                  // const AutoSizeText(
                  //     "Is normally a narrow road. They may be found in urban and rural areas."
                  //     "Traffic lanes are where the road is divided into lanes by road markings. These are used for traffic control and to help navigation."),
                  const SizedBox(
                    height: 10,
                  ),
                  // const AutoSizeText(
                  //     "Check your mirrors for motorcycles approaching from behind and give them space if possible."),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: AutoSizeText(
                        data.subtitle1),
                   ),
                  const SizedBox(
                    height: 10,
                  ),
                   AutoSizeText(
                      data.subtitle2),
                  const SizedBox(
                    height: 20,
                  ),
                 buildImage(data.image1),
                  const SizedBox(
                    height: 10,
                  ),
             //      const AutoSizeText(
             // "),
             //      AutoSizeText(
             //        "Tips",
             //        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
             //      ),

                  // Container(
                  //   padding: const EdgeInsets.all(12.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.green.withOpacity(0.1),
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: Colors.green),
                  //   ),
                  //   child: Column(
                  //     children: [
                  //
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTipWidget(data.tip),
                  ),
                  //
                  // const AutoSizeText(
                  //
                  //     "If you have a collision, you MUST stop. By law, you MUST stop at the scene of the incident if damage or injury is caused to any other person, vehicle, animal or property."),
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
          );
        }
      ),
    );
  }
}
