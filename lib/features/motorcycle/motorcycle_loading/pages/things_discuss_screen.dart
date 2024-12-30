import 'dart:io';

import 'package:driving_lisence/category1.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../safety_and_motorcycle/viewmodel/discuss_with_trainer_provider.dart';
import '../viewmodel/things_discuss.dart';

class ThingsDiscussScreenLoad extends StatefulWidget {
  const ThingsDiscussScreenLoad({super.key});

  @override
  State<ThingsDiscussScreenLoad> createState() =>
      _ThingsDiscussScreenLoadState();
}

class _ThingsDiscussScreenLoadState extends State<ThingsDiscussScreenLoad> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<TrainerDiscussionNotifierLoading>(context, listen: false);
      provider.loadTrainerDiscussion(
          "Things_to_discuss_and_practise_with_your_trainer");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Thing to discuss",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<TrainerDiscussionNotifierLoading>(
          builder: (context, provider, child) {
        final data = provider.trainerDiscussion;
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
                Column(
                  children: data.points
                      .map((e) => buildBulletText(e.toString()))
                      .toList(),
                ),
                createAutoSizeText(data.title1),
                Column(
                  children: data.points1
                      .map((e) => buildBulletText(e.toString()))
                      .toList(),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Category1(), // Replace with your next screen
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
