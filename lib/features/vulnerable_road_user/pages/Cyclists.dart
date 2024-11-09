import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';
import 'motorcycle.dart';

class Cyclists extends StatefulWidget {
  const Cyclists({super.key});

  @override
  State<Cyclists> createState() => _CyclistsState();
}

class _CyclistsState extends State<Cyclists> {
  VulnerableController? _vulnerableController;

  @override
  void didChangeDependencies() {


    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    _vulnerableController = Provider.of<VulnerableController>(context,listen: false);
    _vulnerableController?.fetchCyclistSafety();
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
      body: Consumer<VulnerableController>(
        builder: (context,value,child) {
          final data  = value.cyclistSafety;
          if(data == null)
            {
              return  Center(child: Column(
                children: [
                  LoadingScreen(),

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
              ),);
            }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createHeadingText(data.title1!),
                  createAutoSizeText(data.subtitle!),
                  AutoSizeText(
                    data.title2!,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 buildImage(data.image1!),
                  const SizedBox(
                    height: 05,
                  ),
                   AutoSizeText(
                    data.subtitle2!
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 buildImage(data.image3!),

                  const SizedBox(
                    height: 10,
                  ),

                  AutoSizeText(data.title3!,style: GoogleFonts.roboto(fontWeight: FontWeight.bold),),
               const SizedBox(
                 height: 10,
               ),

                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child:Column(
                      children: [
                        AutoSizeText(data.points![0]),
                        buildBulletText(data.points![1]),
                        buildBulletText(data.points![2]),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(data.subtitle3!),

                  const SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(data.title4!,style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(
                    height: 10,
                  ),
                createAutoSizeText(data.subtitle4!),
                  const SizedBox(
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
          );
        }
      ),
    );
  }
}
