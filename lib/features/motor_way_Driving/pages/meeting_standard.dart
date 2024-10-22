import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/think_about.dart';
import 'package:driving_lisence/features/motor_way_Driving/pages/think_about.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeetingStandard extends StatefulWidget {
  const MeetingStandard({super.key});

  @override
  State<MeetingStandard> createState() => _MeetingStandardState();
}

class _MeetingStandardState extends State<MeetingStandard> {
  Controller? _controller;

  @override
  void didChangeDependencies() {
    _controller = Provider.of<Controller>(context, listen: false);
    _controller?.fetchMeetingTheStandardsData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meeting the Standard"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Consumer<Controller>(
          builder: (BuildContext context, value, Widget? child) {
            final data = value.meetingTheStandards;
            return SingleChildScrollView(
              child: Column(
                children: [
                  createAutoSizeText("Meeting the Standard" ?? ""),
                  createAutoSizeText(data?.title1 ?? ""),
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
                          buildBulletText(data?.points1[0] ?? ""),
                          buildBulletText(data?.points1[1] ?? ""),
                          buildBulletText(data?.points1[2] ?? ""),
                        ],
                      ),
                    ),
                  ),

                  createHeadingText(data?.title2 ?? ""),
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
                          buildBulletText(data?.points2[0] ?? ""),
                          buildBulletText(data?.points2[1] ?? ""),
                          buildBulletText(data?.points2[2] ?? ""),
                          buildBulletText(data?.points2[3] ?? ""),
                          buildBulletText(data?.points2[4] ?? ""),
                          buildBulletText(data?.points2[5] ?? ""),
                          buildBulletText(data?.points2[5] ?? ""),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const ThinkAboutMotor());

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
            );
          },
        ));
  }
}
