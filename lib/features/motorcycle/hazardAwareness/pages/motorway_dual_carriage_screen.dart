import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/motorwat_dual_caariage_provider.dart';
import 'moving_hazard_screen.dart';

class MotorwayDualCarriageScreen extends StatefulWidget {
  const MotorwayDualCarriageScreen({super.key});

  @override
  State<MotorwayDualCarriageScreen> createState() =>
      _MotorwayDualCarriageScreenState();
}

class _MotorwayDualCarriageScreenState
    extends State<MotorwayDualCarriageScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MotorwaysAndDualCarriagewaysProvider11>(context, listen: false);
      provider.loadMotorwaysAndDualCarriageways();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Motorway dual carriage",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<MotorwaysAndDualCarriagewaysProvider11>(
          builder: (context, provider, child) {
        final data = provider.items;
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
            createAutoSizeText(data.title1),
            createAutoSizeText(data.subtitle1),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to the next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovingHazardScreen(), // Replace with your next screen
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
      }),
    );
  }
}
