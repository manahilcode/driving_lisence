import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/other_type_of%20_vehicle/pages/think_about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../Rule_of_road/viewmodel/meeting_standard.dart';
import '../viewmodel/meeting_standard_provider.dart';

class MeetingStandardScreenOtherType extends StatefulWidget {
  const MeetingStandardScreenOtherType({super.key});

  @override
  State<MeetingStandardScreenOtherType> createState() => _MeetingStandardScreenOtherTypeState();
}

class _MeetingStandardScreenOtherTypeState extends State<MeetingStandardScreenOtherType> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MeetingStandardsNotifierType>(context, listen: false);
      provider.loadMeetingStandardsInfo("motorcycle_Other_types_of_vehicle","Meeting_the_standards");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Meeting with standard", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<MeetingStandardsNotifierType>(
          builder: (context,provider,child) {
            final data = provider.info;
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
                    createHeadingText(data.title),
                    createAutoSizeText(data.title1),
                    createHeadingText(data.title2),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThinkAboutScreenOtherType(), // Replace with your next screen
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
                ),
              ),
            );
          }
      ),
    );
  }
}
