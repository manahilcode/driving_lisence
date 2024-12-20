import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
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
      controller.fetchReviewingYourDriving("Reviewing_your_driving");
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
        return Column(
          children: [
            createHeadingText(data.title),
            createAutoSizeText(data.subtitle),
            Column(
              children: data.points
                  .map((e) => buildBulletText(e.toString()))
                  .toList(),
            )
          ],
        );
      }),
    );
  }
}
