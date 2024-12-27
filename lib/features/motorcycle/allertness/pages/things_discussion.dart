import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../category1.dart';
import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/things_discusstion_practice_trainer_provider.dart';

class ThingsDiscussionScreenAllert extends StatefulWidget {
  const ThingsDiscussionScreenAllert({super.key});

  @override
  State<ThingsDiscussionScreenAllert> createState() => _ThingsDiscussionScreenAllertState();
}

class _ThingsDiscussionScreenAllertState extends State<ThingsDiscussionScreenAllert> {
  @override
  void initState() {
    // TODO: implement initState
    //Things_to_discuss_and_practise_with_your_trainer
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<ThingsToDiscussProviderAllert>(context, listen: false);
      provider.fetchThingsToDiscussData("motorcycle_alertness",
          "Things_to_discuss_and_practise_with_your_trainer");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Things_to_discuss_and_practise_with_your_trainer",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<ThingsToDiscussProviderAllert>(
          builder: (context, provider, child) {
        final data = provider.data;

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
              Column(
                children: data.points
                    .map((e) => buildBulletText(e.toString()))
                    .toList(),
              ),
              Gap(10),
              Center(
                child: GestureDetector(
                  onTap: () {
                 //   Navigate to the next screen
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
          ),
        );
      }),
    );
  }
}
