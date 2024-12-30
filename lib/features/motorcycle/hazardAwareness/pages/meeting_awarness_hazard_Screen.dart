import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/hazardAwareness/pages/think_about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/meeting_awareness_meeting_hazard_provider.dart';

class MeetingAwarnessHazardScreen extends StatefulWidget {
  const MeetingAwarnessHazardScreen({super.key});

  @override
  State<MeetingAwarnessHazardScreen> createState() => _MeetingAwarnessHazardScreenState();
}

class _MeetingAwarnessHazardScreenState extends State<MeetingAwarnessHazardScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HazardAwarenessMeetingStandardProvider>(context, listen: false);
      provider.loadHazardAwarenessMeetingStandard();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
          title: "meeting With standard",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),

      body: Consumer<HazardAwarenessMeetingStandardProvider>(
          builder: (context,provider,child) {
            final data = provider.standards;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                    createHeadingText(data.title),
                  createHeadingText(data.title2),
                  Column(
                    children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                  ),
                  createHeadingText(data.title3),
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
                            builder: (context) => ThinkAboutScreenAwareness(), // Replace with your next screen
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
            );
          }
      ),
    );
  }
}
