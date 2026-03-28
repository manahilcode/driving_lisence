import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/other_driver.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';

class Animals extends StatefulWidget {
  const Animals({super.key});

  @override
  State<Animals> createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  VulnerableController? _vulnerableController;

  @override
  void didChangeDependencies() {
    _vulnerableController = Provider.of<VulnerableController>(context,listen: false);
    _vulnerableController?.fetchAnimalsVulnerable();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return  Scaffold(
      appBar: AppBar(
        title:  Text("Animals",style: GoogleFonts.roboto(
            color: Colors.white
        ),),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<VulnerableController>(
        builder: (context,value,child) {
          final data = value.animalsVulnerable;
          if(data == null)
            {
              return const Center(child: LoadingScreen(),);
            }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  createHeadingText(data.title),
                 buildImage(data.image),
                  const SizedBox(
                    height: 10,
                  ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: AutoSizeText(data.subtitle1),
                 ),
                  const SizedBox(
                    height: 10,
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
                          buildBulletText(data.points[0]),
                          buildBulletText(data.points[1]),
                          buildBulletText(data.points[2]),
                          buildBulletText(data.points[3]),
                          buildBulletText(data.points[4]),
                        ],
                      ),
                    ),
                  ),
                  // AutoSizeText("${bullet} Stay well back."),
                  // AutoSizeText("${bullet} Don’t rev your engine or sound your horn near horses as this may startle them."),
                  // AutoSizeText("${bullet} Go very slowly and be ready to stop."),
              // const SizedBox(
              //   height: 20,
              // ),
              //     const AutoSizeText("When it’s safe to overtake"),
              //     AutoSizeText("${bullet} drive past slowly"),
              //     AutoSizeText("${bullet} leave plenty of room."),

                  const SizedBox(
                    height: 20,
                  ),

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: AutoSizeText(data.subtitle),
                   ),
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
                            builder: (context) => const OtherDriver(),
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
          );
        }
      ),
    );
  }
}
