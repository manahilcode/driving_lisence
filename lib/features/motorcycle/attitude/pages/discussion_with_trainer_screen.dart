import 'package:driving_lisence/category1.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/discussion_with_trianer_provider.dart';

class DiscussionWithTrainerScreenAttitude extends StatefulWidget {
  const DiscussionWithTrainerScreenAttitude({super.key});

  @override
  State<DiscussionWithTrainerScreenAttitude> createState() => _DiscussionWithTrainerScreenAttitudeState();
}

class _DiscussionWithTrainerScreenAttitudeState extends State<DiscussionWithTrainerScreenAttitude> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TrainerDiscussionProviderAttitude>(context, listen: false);
      provider.fetchTrainerDiscussionInfo("motorcycle_attitude", "Things_to_discuss_and_practise_with_your_trainer");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
          title: "Discussion with trainer ",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<TrainerDiscussionProviderAttitude>(
          builder: (context,provider,child) {
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
                createHeadingText(data.title1),
                Column(
                  children: data.points.map((e)=>buildBulletText(e.toString())).toList(),

                ),

                createHeadingText(data.title2),
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
                          builder: (context) => Category1(), // Replace with your next screen
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
          }
      ),
    );
  }
}
