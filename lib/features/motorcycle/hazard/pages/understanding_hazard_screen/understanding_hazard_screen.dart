import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/loader.dart';
import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../viewmodel/understanding_hazard_provider.dart';

class UnderstandingHazardScreen extends StatefulWidget {
  const UnderstandingHazardScreen({super.key});

  @override
  State<UnderstandingHazardScreen> createState() =>
      _UnderstandingHazardScreenState();
}

class _UnderstandingHazardScreenState extends State<UnderstandingHazardScreen> {
  @override
  void initState() {
    Future.microtask(() {
      final controller = Provider.of<UnderstandingHazardsProvider>(
          context,
          listen: false);
      controller.fetchUnderstandingHazard(
          "motorcycle_seeing_hazard", "Understanding_hazards");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Understand Hazard",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<UnderstandingHazardsProvider>(
          builder: (context, provider, child) {
        final data = provider.understandingHazard;
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
                Gap(10),
                Column(
                  children: data.points
                      .map((item) => Padding(
                    padding: const EdgeInsets.all(8.0), // Add padding around each item
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Example background color
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      padding: const EdgeInsets.all(16.0), // Internal padding for the Container
                      child: buildBulletText(item.toString()), // Your custom widget
                    ),
                  ))
                      .toList(),
                ),
            
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
          ),
        );
      }),
    );
  }
}
