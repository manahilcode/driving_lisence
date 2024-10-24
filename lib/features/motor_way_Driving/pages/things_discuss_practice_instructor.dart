import 'package:driving_lisence/category.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThingsDiscussPracticeInstructorMotorWay extends StatefulWidget {
  const ThingsDiscussPracticeInstructorMotorWay({super.key});

  @override
  State<ThingsDiscussPracticeInstructorMotorWay> createState() =>
      _ThingsDiscussPracticeInstructorMotorWayState();
}

class _ThingsDiscussPracticeInstructorMotorWayState
    extends State<ThingsDiscussPracticeInstructorMotorWay> {
  Controller? _controller;

  @override
  void didChangeDependencies() {
    _controller = Provider.of<Controller>(context, listen: false);
    _controller?.fetchThingsToDiscussData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text("Things to discuss and practise with your instructor"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Consumer<Controller>(
          builder: (BuildContext context, value, Widget? child) {
            final data = value.thingsToDiscussWithInstructor;
            return Column(
              children: [
                createHeadingText(
                    "Things to discuss and practise with your instructor"),
                createAutoSizeText(data?.subtitle ?? ""),
                createAutoSizeText(data?.title ?? ""),
                Container(
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
                        buildBulletText(data?.points[0] ?? ""),
                        buildBulletText(data?.points[1] ?? ""),
                      ],
                    ),
                  ),
                ),
                createAutoSizeText(data?.subtitle2 ?? ""),
                const SizedBox(height: 20),
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
            );
          },
        ));
  }
}