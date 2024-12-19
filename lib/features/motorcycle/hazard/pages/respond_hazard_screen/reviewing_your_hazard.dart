import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/reviewing_driver_provider.dart';

class ReviewingYourHazard extends StatefulWidget {
  const ReviewingYourHazard({super.key});

  @override
  State<ReviewingYourHazard> createState() => _ReviewingYourHazardState();
}

class _ReviewingYourHazardState extends State<ReviewingYourHazard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Reviewing Driving", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<ReviewingYourDrivingProvider>(
        builder: (context,provider,child) {
          final data = provider.reviewingYourDriving;
          return Column(
            children: [
              createHeadingText(data!.title),
              createAutoSizeText(data.subtitle),
              Column(
                children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
              )
            ],
          );
        }
      ),
    );
  }
}
