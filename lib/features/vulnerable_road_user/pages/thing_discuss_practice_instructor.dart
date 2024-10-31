import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../category.dart';
import '../viewmodel/controller.dart';

class ThingDiscussPracticeInstructor extends StatefulWidget {
  const ThingDiscussPracticeInstructor({super.key});

  @override
  State<ThingDiscussPracticeInstructor> createState() =>
      _ThingDiscussPracticeInstructorState();
}

class _ThingDiscussPracticeInstructorState
    extends State<ThingDiscussPracticeInstructor> {
  VulnerableController? _vulnerableController;

  @override
  void didChangeDependencies() {
    _vulnerableController =
        Provider.of<VulnerableController>(context, listen: false);
    _vulnerableController?.fetchDiscussInstructorVulnerable();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title: Text("Thing Discuss Practice instructor",
            style: GoogleFonts.roboto(color: Colors.white)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<VulnerableController>(builder: (context, value, child) {
        final data = value.discussInstructorVulnerable;
        if (data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createHeadingText(data.title),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(data.subtitle),
                ),
          
                const SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                  data.title1,
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
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
                      children: data.points.map((toElement) {
                        return buildBulletText(toElement.toString());
                      }).toList(),
                    ),
                  ),
                ),
          
                // AutoSizeText("${bullet} which sticks are used by people with different disabilities; for example, a white stick with a red band",textAlign: TextAlign.center,),
                // AutoSizeText("${bullet} the times when motorcyclists may be particularly vulnerable and how you should behave towards them",textAlign: TextAlign.center),
                // AutoSizeText("${bullet} what you think a cyclist’s experience of driving through traffic may be. How can you make them feel safer?",textAlign: TextAlign.center),
          
                const SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  data.title2,
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
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
                      children: data.points2.map((toElement) {
                        return buildBulletText(toElement.toString());
                      }).toList(),
                    ),
                  ),
                ),
                // AutoSizeText("${bullet} driving near schools at times when students and parents are likely to be arriving or leaving",textAlign: TextAlign.center),
                // AutoSizeText("${bullet} driving down country lanes where you may encounter horse riders or pedestrians walking along the road",textAlign: TextAlign.center),
                // AutoSizeText("${bullet} identifying the signs warning you of vulnerable road users, eg a red triangle with a picture of a bicycle.",textAlign: TextAlign.center),
                const SizedBox(
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
                          builder: (context) => Category(),
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
                            "Return",
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
      }),
    );
  }
}
