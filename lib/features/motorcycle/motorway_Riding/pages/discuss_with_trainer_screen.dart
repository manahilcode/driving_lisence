import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/loader.dart';
import '../viewmodel/dicuss_with_trainer.dart';

class DiscussWithTrainerScreenRiding extends StatefulWidget {
  const DiscussWithTrainerScreenRiding({super.key});

  @override
  State<DiscussWithTrainerScreenRiding> createState() => _DiscussWithTrainerScreenRidingState();
}

class _DiscussWithTrainerScreenRidingState extends State<DiscussWithTrainerScreenRiding> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TrainerPracticeProviderRiding>(context, listen: false);
      provider.fetchTrainerPracticeData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "discuss with trainer", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<TrainerPracticeProviderRiding>(
        builder: (context,provider,child) {
          final data = provider.trainerPracticeData;
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
                  createAutoSizeText(data.title1),
                  Column(
                    children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                  ),
                  createAutoSizeText(data.title2),
                  Column(
                    children: data.points1.map((e)=>buildBulletText(e.toString())).toList(),
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next screen
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Othertype6(), // Replace with your next screen
                        //   ),
                        // );
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
