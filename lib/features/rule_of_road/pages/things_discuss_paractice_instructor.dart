import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/category.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class ThingsDiscussParacticeInstructorRuleRoad extends StatefulWidget {
  const ThingsDiscussParacticeInstructorRuleRoad({super.key});

  @override
  State<ThingsDiscussParacticeInstructorRuleRoad> createState() =>
      _ThingsDiscussParacticeInstructorRuleRoadState();
}

class _ThingsDiscussParacticeInstructorRuleRoadState
    extends State<ThingsDiscussParacticeInstructorRuleRoad> {
  RuleRoadController? _ruleRoadController;
  @override
  void didChangeDependencies() {
    _ruleRoadController =
        Provider.of<RuleRoadController>(context, listen: false);
    _ruleRoadController?.fetchThingsToDiscussPractice();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Things to Discuss with your Instructor ",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<RuleRoadController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.thingsToDiscussPractice;
          if (data == null) {
            return Center(
                child: CircularProgressIndicator()); // or any placeholder
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(data.title!,maxLines: 4,
                      style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  createAutoSizeText(data.subtitle!),
                  createHeadingText(data.title1!),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
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
                          buildBulletText(data.points1![4]),
                          buildBulletText(data.points1![5]),
                        ],
                      ),
                    ),
                  ),
                  createHeadingText(data.title2!),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                        ],
                      ),
                    ),
                  ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
