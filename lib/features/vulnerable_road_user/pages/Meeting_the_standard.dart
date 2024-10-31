import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/thing_discuss_practice_instructor.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/think_about.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class MeetingTheStandard extends StatefulWidget {
  const MeetingTheStandard({super.key});

  @override
  State<MeetingTheStandard> createState() => _MeetingTheStandardState();
}

class _MeetingTheStandardState extends State<MeetingTheStandard> {
  VulnerableController? _vulnerableController;

  @override
  void didChangeDependencies() {
    _vulnerableController = Provider.of<VulnerableController>(context,listen: false);
    _vulnerableController?.fetchMeetingStandardVulnerable();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title: Text("Meeting the standard",style: GoogleFonts.roboto(
            color: Colors.white
        )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<VulnerableController>(
        builder: (context,value,child) {
          final data = value.meetingStandardVulnerable;
          if(data ==  null)
            {
              return Center(
                child: CircularProgressIndicator(),
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
                  SizedBox(height: 10),
                  Text(
                    data.title1,
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

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

                        ],
                      ),
                    ),
                  ),
                  // AutoSizeText(
                  //     "look out for the effect of starting your engine near vulnerable road users. Passing cyclists or pedestrians may be affected"),
                  // AutoSizeText(
                  //     "look for vulnerable road users at junctions, roundabouts and crossings. For example"),
                //  AutoSizeText("${bullet}cyclists"),
                //  AutoSizeText("${bullet}motorcyclists"),
                //  AutoSizeText("${bullet}horse riders"),
                  SizedBox(height: 20),
                  AutoSizeText(
                    data.title2,
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold),
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
                          buildBulletText(data.points1[0]),
                          buildBulletText(data.points1[1]),
                          buildBulletText(data.points1[2]),
                          buildBulletText(data.points1[3]),
                          buildBulletText(data.points1[5]),

                        ],
                      ),
                    ),
                  ),

               //   SizedBox(height: 20),
               //    AutoSizeText(
               //        "${bullet} when other road users are vulnerable and how to allow for them"),
               //    AutoSizeText(
               //        "${bullet} the rules that apply to vulnerable road users, like cyclists and motorcyclists, and the position that they may select on the road as a result"),
               //    AutoSizeText(
               //        "${bullet} how vulnerable road users may act on the road. For example"),
                 // AutoSizeText("${bullet} cyclists may wobble"),
                 // AutoSizeText("${bullet} children may run out"),
                 // AutoSizeText(
                  //    "${bullet} older people may take longer to cross the road."),
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
                            builder: (context) => const ThinkAbout(),
                          ),
                          (Route<dynamic> route) =>
                              false, // Removes all previous routes
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
