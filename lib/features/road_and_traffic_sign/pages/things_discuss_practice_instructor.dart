import 'package:driving_lisence/category.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/controller.dart';
class ThingsDiscussPracticeInstructorTrafficSign extends StatefulWidget {
  const ThingsDiscussPracticeInstructorTrafficSign({super.key});

  @override
  State<ThingsDiscussPracticeInstructorTrafficSign> createState() => _ThingsDiscussPracticeInstructorTrafficSignState();
}

class _ThingsDiscussPracticeInstructorTrafficSignState extends State<ThingsDiscussPracticeInstructorTrafficSign> {
  RoadSignController? _roadSignController;
  @override
  void didChangeDependencies() {
    _roadSignController = Provider.of<RoadSignController>(context,listen: false);
    _roadSignController?.fetchDiscussInstructorRoadSign("discuss_with_your_instructor");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thing Discuss with Instructor",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<RoadSignController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.discussInstructorRoadSign;
          if(data == null)
          {
            return Center(child: LoadingScreen(),);
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title!),
                  createAutoSizeText(data.subtitle!),
                  createHeadingText(data.title2!),
                  Gap(10),
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
                        buildBulletText(data.points1![3]),
                        buildBulletText(data.points1![4]),
                        buildBulletText(data.points1![5]),
              
                      ],
                    ),
                  ),
                  createHeadingText(data.title3!),
                 const  Gap(10),
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
                      Route newRoute = MaterialPageRoute(builder: (context) =>  Category());
              
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
              ),
            ),
          );
        },
      ),
    );
  }
}
