import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../viewmodel/reviewing_driver_provider.dart';

class ReviewingYourHazard extends StatefulWidget {
  const ReviewingYourHazard({super.key});

  @override
  State<ReviewingYourHazard> createState() => _ReviewingYourHazardState();
}

class _ReviewingYourHazardState extends State<ReviewingYourHazard> {
  @override
  void initState() {
    //Reviewing_your_driving
    Future.microtask(() {
      final controller =
      Provider.of<ReviewingYourDrivingProvider>(context, listen: false);
      controller.fetchReviewingYourDriving(" Reviewing_your_driving");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
          title: "Reviewing Driving",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {
            Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

            Navigator.pushAndRemoveUntil(
              context,
              newRoute,
                  (Route<dynamic> route) => false, // Removes all previous routes
            );
          }),
      body: Consumer<ReviewingYourDrivingProvider>(
          builder: (context, provider, child) {
        final data = provider.reviewingYourDriving;
        if (data == null) {
          return Center(
            child: LoadingScreen(),
          );
        }
        return Padding(
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
              Gap(20),
              GestureDetector(
                onTap: () {
                  Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );

                },
                child: Center(
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 30.0),
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
                    child: const Center(
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
