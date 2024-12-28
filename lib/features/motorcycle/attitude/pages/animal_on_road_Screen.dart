import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/animal_on_road_provider.dart';
import 'following_safety_screen.dart';

class AnimalOnRoadScreen extends StatefulWidget {
  const AnimalOnRoadScreen({super.key});

  @override
  State<AnimalOnRoadScreen> createState() => _AnimalOnRoadScreenState();
}

class _AnimalOnRoadScreenState extends State<AnimalOnRoadScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AnimalsOnTheRoadProviderAttitude>(context, listen: false);
      provider.fetchAnimalsOnTheRoadData("motorcycle_attitude", "Animals_on_the_road");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Animal On Road",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<AnimalsOnTheRoadProviderAttitude>(
          builder: (context, provider, child) {
        final data = provider.data;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }

        return Column(
          children: [
            createHeadingText(data.title),
            createAutoSizeText(data.subtitle),
            createAutoSizeText(data.subtitle1),
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
                      builder: (context) => FollowingSafetyScreen(), // Replace with your next screen
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
