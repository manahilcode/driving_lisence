import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/rule_of_road/pages/think_about.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';

class MeetingTheStandardRuleRoad extends StatefulWidget {
  const MeetingTheStandardRuleRoad({super.key});

  @override
  State<MeetingTheStandardRuleRoad> createState() =>
      _MeetingTheStandardRuleRoadState();
}

class _MeetingTheStandardRuleRoadState
    extends State<MeetingTheStandardRuleRoad> {
  RuleRoadController? _ruleRoadController;
  @override
  void didChangeDependencies() {
    _ruleRoadController =
        Provider.of<RuleRoadController>(context, listen: false);
    _ruleRoadController?.fetchMeetingStandards();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Meeting the Standard",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Consumer<RuleRoadController>(
          builder: (BuildContext context, value, Widget? child) {
            final data = value.meetingStandards;
            if (data == null) {
              return Center(
                  child: LoadingScreen()); // or any placeholder
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title!),
                  createAutoSizeText(data.subtitle2!),
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
                        buildBulletText(data.points![5]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const ThinkAboutRuleRoad());

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
