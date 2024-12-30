import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/vulnurable_road_user/pages/think_about_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/meeting_standard_provider.dart';

class MeetingStandardScreenVulnerable extends StatefulWidget {
  const MeetingStandardScreenVulnerable({super.key});

  @override
  State<MeetingStandardScreenVulnerable> createState() =>
      _MeetingStandardScreenVulnerableState();
}

class _MeetingStandardScreenVulnerableState
    extends State<MeetingStandardScreenVulnerable> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MeetingStandardsProviderVulnerable>(context,
          listen: false);
      provider.fetchMeetingStandardsData("Meeting_the_standards");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Meeting with standard",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<MeetingStandardsProviderVulnerable>(
          builder: (context, provider, child) {
        final data = provider.data;
        if (data == null) {
          return LoadingScreen();
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data.title).animate().fadeIn(duration: 1.seconds),

                createAutoSizeText(data.title1).animate().fadeIn(duration: 1.seconds),
                Column(
                  children: data.points
                      .map((e) => buildBulletText(e.toString()).animate().fadeIn(duration: 1.seconds),)
                      .toList(),
                ),
                createAutoSizeText(data.title2).animate().fadeIn(duration: 1.seconds),
                Column(
                  children: data.points1
                      .map((e) => buildBulletText(e.toString()).animate().fadeIn(duration: 1.seconds),)
                      .toList(),
                ),
                 Gap(10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ThinkAboutScreenVulnerable(), // Replace with your next screen
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
                ).animate().fadeIn(duration: 1.seconds),
              ],
            ),
          ),
        );
      }),
    );
  }
}
