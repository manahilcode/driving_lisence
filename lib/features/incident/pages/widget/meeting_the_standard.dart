import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/think_about.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/loader.dart';
import '../../viewmodel/controller.dart';

class MeetingTheStandardIncident extends StatefulWidget {
  const MeetingTheStandardIncident({super.key});

  @override
  State<MeetingTheStandardIncident> createState() =>
      _MeetingTheStandardIncidentState();
}

class _MeetingTheStandardIncidentState
    extends State<MeetingTheStandardIncident> {
  IncidentController? _incidentController;

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _incidentController =
        Provider.of<IncidentController>(context, listen: false);
    _incidentController?.fetchMeetingStandardIncident("meeting_the_standard");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meeting the standards",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IncidentController>(builder: (context, value, child) {
        final data = value.meetingStandardIncident;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data.title!),
                Gap(10),
                createAutoSizeText(data.title2!),
                Gap(10),
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
                        buildBulletText(data.points1![0]),
                        buildBulletText(data.points1![1]),
                        buildBulletText(data.points1![2]),
                        buildBulletText(data.points1![3]),
                      ],
                    ),
                  ),
                ),
                Gap(10),
                createAutoSizeText("You must know and understand"),
                Gap(10),
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
                        buildBulletText(data.points2![0]),
                        buildBulletText(data.points2![1]),
                        buildBulletText(data.points2![2]),
                        buildBulletText(data.points2![3]),
                        buildBulletText(data.points2![4]),
                        buildBulletText(data.points2![5]),
                        buildBulletText(data.points2![6]),
                        buildBulletText(data.points2![7]),
                        buildBulletText(data.points2![8]),
                        buildBulletText(data.points2![9]),
                        buildBulletText(data.points2![10]),
                        buildBulletText(data.points2![11]),
                        buildBulletText(data.points2![12]),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThinkAbout()),
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
      }),
    );
  }
}
