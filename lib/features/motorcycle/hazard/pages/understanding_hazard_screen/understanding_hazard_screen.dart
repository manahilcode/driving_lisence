import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/loader.dart';
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

        return Column(
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
            )
          ],
        );
      }),
    );
  }
}
