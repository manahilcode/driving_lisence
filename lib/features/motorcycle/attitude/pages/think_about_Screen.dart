import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../allertness/viewmodel/think_about_provider.dart';
import '../../motorway_Riding/viewmodel/think_about_provider.dart';
import '../viewmodel/think_about_provider.dart';
import 'discussion_with_trainer_screen.dart';

class ThinkAboutScreenAttitude extends StatefulWidget {
  const ThinkAboutScreenAttitude({super.key});

  @override
  State<ThinkAboutScreenAttitude> createState() => _ThinkAboutScreenAttitudeState();
}

class _ThinkAboutScreenAttitudeState extends State<ThinkAboutScreenAttitude> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ThinkAboutProviderAttitude>(context, listen: false);
      provider.fetchThinkAboutInfo("motorcycle_attitude", "Think_about");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Think about",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<ThinkAboutProviderAttitude>(builder: (context, provider, child) {
        final data = provider.data;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }

        return Column(
          children: [
            createHeadingText(data.title),
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
                      builder: (context) => DiscussionWithTrainerScreenAttitude(), // Replace with your next screen
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
