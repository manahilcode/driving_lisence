import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/thing_discuss_practice_instructor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';
class ThinkAbout extends StatefulWidget {
  const ThinkAbout({super.key});

  @override
  State<ThinkAbout> createState() => _ThinkAboutState();
}

class _ThinkAboutState extends State<ThinkAbout> {
  VulnerableController? _vulnerableController;

  @override
  void didChangeDependencies() {
    _vulnerableController = Provider.of<VulnerableController>(context,listen: false);
    _vulnerableController?.fetchThinkAboutVulnerable();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return  Scaffold(
      appBar: AppBar(
        title:  Text("Think about",style: GoogleFonts.roboto(
            color: Colors.white
        )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<VulnerableController>(
        builder: (context,value,child) {
          final data  = value.thinkAboutVulnerable;
          if(data == null)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    createHeadingText(data.title),
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
                              builder: (context) => const ThingDiscussPracticeInstructor(),
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
      ),
    );
  }
}
