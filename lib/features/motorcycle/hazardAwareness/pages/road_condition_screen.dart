import 'package:driving_lisence/core/imagewithtext.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/hazardAwareness/pages/yourself_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/road_condition_provider.dart';

class RoadConditionScreen extends StatefulWidget {
  const RoadConditionScreen({super.key});

  @override
  State<RoadConditionScreen> createState() => _RoadConditionScreenState();
}

class _RoadConditionScreenState extends State<RoadConditionScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<RoadConditionProvider>(context, listen: false);
      provider.loadRoadConditions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Road and Weather Condition",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body:
          Consumer<RoadConditionProvider>(builder: (context, provider, child) {
        final data = provider.items;
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
                  children: [
                    ImageWithTextCard(
                        imageUrl: data.image.imageUrl, subtitle: data.image.text)
                  ],
                ),
                createAutoSizeText(data.subtitle2),
                Column(
                  children: [
                    ImageWithTextCard(
                        imageUrl: data.image1.imageUrl, subtitle: data.image1.text)
                  ],
                ),
                Column(
                  children: [
                    ImageWithTextCard(
                        imageUrl: data.image2.imageUrl, subtitle: data.image2.text)
                  ],
                ),
                Column(
                  children: [
                    ImageWithTextCard(
                        imageUrl: data.image3.imageUrl, subtitle: data.image3.text)
                  ],
                ),
                Gap(20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              YourselfScreen(), // Replace with your next screen
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
