import 'package:driving_lisence/features/road_and_traffic_sign/pages/things_discuss_practice_instructor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/sharedUi.dart';
import '../viewmodel/controller.dart';
class ThinkAboutRoadTrafficSign extends StatefulWidget {
  const ThinkAboutRoadTrafficSign({super.key});

  @override
  State<ThinkAboutRoadTrafficSign> createState() => _ThinkAboutRoadTrafficSignState();
}

class _ThinkAboutRoadTrafficSignState extends State<ThinkAboutRoadTrafficSign> {
  RoadSignController? _roadSignController;
  @override
  void didChangeDependencies() {
    _roadSignController = Provider.of<RoadSignController>(context,listen: false);
    _roadSignController?.fetchThinkAboutRoadSign("think_about");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Think About"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<RoadSignController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.introductionRoadsign;
          if(data == null)
          {
            return Center(child: CircularProgressIndicator(),);
          }
          return Column(
            children: [
              createHeadingText(data.title!),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildBulletText(data.points![0]),
                    buildBulletText(data.points![1]),
                    buildBulletText(data.points![2]),
                    buildBulletText(data.points![3]),
                    buildBulletText(data.points![4]),


                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Route newRoute = MaterialPageRoute(builder: (context) => const ThingsDiscussPracticeInstructorTrafficSign());

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