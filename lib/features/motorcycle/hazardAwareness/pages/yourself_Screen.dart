import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/yourself_provider.dart';
import 'meeting_awarness_hazard_Screen.dart';

class YourselfScreen extends StatefulWidget {
  const YourselfScreen({super.key});

  @override
  State<YourselfScreen> createState() => _YourselfScreenState();
}

class _YourselfScreenState extends State<YourselfScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<YourselfProvider>(context, listen: false);
      provider.fetchAwarenessHazardData("Yourself");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Alertness",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<YourselfProvider>(builder: (context, provider, child) {
        final data = provider.data;
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
                createAutoSizeText(data.subtitle),
                createHeadingText(data.title1),
                createAutoSizeText(data.subtitle1),
                createHeadingText(data.title2),
                createAutoSizeText(data.subtitle2),
                createHeadingText(data.title3),
                createAutoSizeText(data.subtitle4),
                createHeadingText(data.title4),
                createAutoSizeText(data.subtitle4),
                createHeadingText(data.title5),
                createAutoSizeText(data.subtitle5),
                createHeadingText(data.title6),
                createAutoSizeText(data.subtitle6),
                Column(
                  children: data.points
                      .map((e) => buildBulletText(e.toString()))
                      .toList(),
                ),
                Column(
                  children: data.points1
                      .map((e) => buildBulletText(e.toString()))
                      .toList(),
                ),
                Gap(20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MeetingAwarnessHazardScreen(), // Replace with your next screen
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
      }),
    );
  }
}
