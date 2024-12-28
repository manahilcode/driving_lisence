import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/keep_your_motorcycle_stable.dart';

class KeepYourMotorcycleStableScreen extends StatefulWidget {
  const KeepYourMotorcycleStableScreen({super.key});

  @override
  State<KeepYourMotorcycleStableScreen> createState() =>
      _KeepYourMotorcycleStableScreenState();
}

class _KeepYourMotorcycleStableScreenState
    extends State<KeepYourMotorcycleStableScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MotorcycleStabilityNotifier>(context, listen: false);
      provider.loadMotorcycleStability("Animals_on_the_road");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Keep your motorcycle stable",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<MotorcycleStabilityNotifier>(
          builder: (context, provider, child) {
        final data = provider.motorcycleStability;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }

        return Column(
          children: [
            createHeadingText(data.title),
            createAutoSizeText(data.subtitle),
            buildImage(data.image),
            Column(
              children: data.points
                  .map((e) => buildBulletText(e.toString()))
                  .toList(),
            ),
            Column(
              children: data.tip
                  .map((e) => createAutoSizeText(e.toString()))
                  .toList(),
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
        );
      }),
    );
  }
}
