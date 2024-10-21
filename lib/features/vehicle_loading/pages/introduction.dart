import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_loading/pages/keep_your_stable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IntroductionVehicleLoading extends StatefulWidget {
  const IntroductionVehicleLoading({super.key});

  @override
  State<IntroductionVehicleLoading> createState() => _IntroductionVehicleLoadingState();
}

class _IntroductionVehicleLoadingState extends State<IntroductionVehicleLoading> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle Han"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            createHeadingText("Vehicle loading"),
            Gap(10),
            buildImage("https://via.placeholder.com/400"),
            Gap(10),
            createAutoSizeText("In this section, you’ll learn about"),
            Gap(10),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  buildBulletText("how to carry loads safely in your car"),
                  buildBulletText("carrying passengers and animals safely"),
                  buildBulletText("towing a caravan or trailer"),
                  buildBulletText("the effect of carrying a load on your vehicle’s fuel consumption."),

                ],
              ),
            ),
            Gap(10),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const KeepYourStable()),
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
  }
}
