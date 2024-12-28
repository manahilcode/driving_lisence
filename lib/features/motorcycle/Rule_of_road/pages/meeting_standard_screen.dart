import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/Rule_of_road/pages/think_about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../other_type_of _vehicle/viewmodel/meeting_standard_provider.dart';
import '../repo/meeting_standard_repo.dart';
import '../viewmodel/meeting_standard.dart';

class MeetingStandardScreenRule_of_road extends StatefulWidget {
  const MeetingStandardScreenRule_of_road({super.key});

  @override
  State<MeetingStandardScreenRule_of_road> createState() => _MeetingStandardScreenRule_of_roadState();
}

class _MeetingStandardScreenRule_of_roadState extends State<MeetingStandardScreenRule_of_road> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MeetingStandardsNotifierRule>(context, listen: false);
      provider.loadMeetingStandards("motorcycle_Rules_of_the_road","Meeting_the_standards");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Meeting with standard", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<MeetingStandardsNotifierRule>(
          builder: (context,provider,child) {
            final data = provider.data;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }

            return Column(
              children: [
                  createHeadingText(data.title),
                createAutoSizeText(data.title1),
                createAutoSizeText(data.subtitle2),
                Column(
                  children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                ),
                Column(
                  children: data.points1.map((e)=>buildBulletText(e.toString())).toList(),
                ),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThinkAboutScreenRuleOfRoad(), // Replace with your next screen
                        ),
                      );
                    },
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(
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
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
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
          }
      ),

    );
  }
}
