import 'package:driving_lisence/category.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class ThingsDiscussParacticeInstructor extends StatefulWidget {
  const ThingsDiscussParacticeInstructor({super.key});

  @override
  State<ThingsDiscussParacticeInstructor> createState() =>
      _ThingsDiscussParacticeInstructorState();
}

class _ThingsDiscussParacticeInstructorState
    extends State<ThingsDiscussParacticeInstructor> {
  IntroductionController? _controller;

  @override
  void didChangeDependencies() async {
    _controller = Provider.of<IntroductionController>(context, listen: false);
    await _controller?.getPracticeWithInstructor();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Things Discuss Practice Instructor"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IntroductionController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.practiceWithInstructor;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  createHeadingText(data?.title ?? ""),
                  createAutoSizeText(data?.subtitle ?? ""),
                //  createAutoSizeText(data?.title2 ?? ""),
                  // Container(
                  //   padding: const EdgeInsets.all(12.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.green.withOpacity(0.1),
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: Colors.green),
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       buildBulletText(data!.points1[0]),
                  //       buildBulletText(data.points1[1]),
                  //       buildBulletText(data.points1[2]),
                  //     ],
                  //   ),
                  // ),
                 // createAutoSizeText(data.title3 ?? ""),
                 //  Container(
                 //    padding: const EdgeInsets.all(12.0),
                 //    decoration: BoxDecoration(
                 //      color: Colors.green.withOpacity(0.1),
                 //      borderRadius: BorderRadius.circular(10),
                 //      border: Border.all(color: Colors.green),
                 //    ),
                 //    child: Column(
                 //      children: [
                 //        buildBulletText(data.points2[0]),
                 //        buildBulletText(data.points2[1]),
                 //        buildBulletText(data.points2[2]),
                 //      ],
                 //    ),
                 //  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Route newRoute =
                          MaterialPageRoute(builder: (context) => Category());
              
                      Navigator.pushAndRemoveUntil(
                        context,
                        newRoute,
                        (Route<dynamic> route) =>
                            false, // Removes all previous routes
                      );
                    },
                    child: Center(
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
