import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/safety_and_motorcycle/pages/think_about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/meeting_standard_provider.dart';

class MeetingStandardScreenSafety extends StatefulWidget {
  const MeetingStandardScreenSafety({super.key});

  @override
  State<MeetingStandardScreenSafety> createState() => _MeetingStandardScreenSafetyState();
}

class _MeetingStandardScreenSafetyState extends State<MeetingStandardScreenSafety> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MotorcycleSafetyNotifierSafety>(context, listen: false);
      provider.fetchData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "meeting standard", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<MotorcycleSafetyNotifierSafety>(
          builder: (context,provider,child) {
            final data = provider.safetyData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     createHeadingText(data.title),
                    createAutoSizeText(data.title1),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    createAutoSizeText(data.title2),
                    Column(
                      children: data.points1.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThinkAboutScreenSafety(), // Replace with your next screen
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
