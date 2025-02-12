import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/attitude/pages/think_about_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../road_and_traffic_sign/viewmodel/meeting_standard.dart';
import '../viewmodel/meeting_standard_repo.dart';

class MeetingStandardScreenAttitude extends StatefulWidget {
  const MeetingStandardScreenAttitude({super.key});

  @override
  State<MeetingStandardScreenAttitude> createState() => _MeetingStandardScreenAttitudeState();
}

class _MeetingStandardScreenAttitudeState extends State<MeetingStandardScreenAttitude> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<StandardsProviderAttitude>(context, listen: false);
      provider.fetchStandardsData("motorcycle_attitude", "Meeting_the_standards");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Meeting standard",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<StandardsProviderAttitude>(builder: (context, provider, child) {
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
            createAutoSizeText(data.title2),
            Column(
              children: data.points
                  .map((e) => buildBulletText(e.toString()))
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
                      builder: (context) => ThinkAboutScreenAttitude(), // Replace with your next screen
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
      }),
    );
  }
}
