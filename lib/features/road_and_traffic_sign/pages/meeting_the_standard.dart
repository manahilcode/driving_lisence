import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/road_and_traffic_sign/pages/think_about.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';
class MeetingTheStandardRoadTrafficSign extends StatefulWidget {
  const MeetingTheStandardRoadTrafficSign({super.key});

  @override
  State<MeetingTheStandardRoadTrafficSign> createState() => _MeetingTheStandardRoadTrafficSignState();
}

class _MeetingTheStandardRoadTrafficSignState extends State<MeetingTheStandardRoadTrafficSign> {
  RoadSignController? _roadSignController;
  @override
  void didChangeDependencies() {
    _roadSignController = Provider.of<RoadSignController>(context,listen: false);
    _roadSignController?.fetchMeetingStandardRoadSign("meeting_the_standard");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meeting Standard",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<RoadSignController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.meetingStandardRoadSign;
          if(data == null)
          {
            return Center(child: CircularProgressIndicator(),);
          }
          return Column(
            children: [
              createHeadingText(data.title!),
              createHeadingText(data.title2!),
              Container(
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

                  ],
                ),
              ),
              createHeadingText(data.title3!),
              Container(
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

                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Route newRoute = MaterialPageRoute(builder: (context) => const ThinkAboutRoadTrafficSign());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
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
      ),
    );
  }
}
