import 'package:driving_lisence/features/motor_way_Driving/pages/motor_way_driving.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/sharedUi.dart';
import '../viewmodel/controller.dart';

class IntroductionHighWay extends StatefulWidget {
  const IntroductionHighWay({super.key});

  @override
  State<IntroductionHighWay> createState() => _IntroductionHighWayState();
}

class _IntroductionHighWayState extends State<IntroductionHighWay> {
  Controller? _controller;
  @override
  void didChangeDependencies() {
    _controller = Provider.of<Controller>(context, listen: false);
    _controller?.fetchIntroductionHighwayData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Introduction"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<Controller>(
        builder: (BuildContext context, value, Widget? child) {
          final data  = value.introductionHighway;
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data?.title ?? ""),
                buildImage(data?.image ?? ""),
                createAutoSizeText("In this section, you’ll learn about"),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                  child: Column(
                    children: [
                      buildBulletText(data?.points[0] ?? ""),
                      buildBulletText(data?.points[1] ?? ""),
                      buildBulletText(data?.points[2] ?? ""),
                      buildBulletText(data?.points[3] ?? ""),
                    ],
                  ),
                ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(
                        builder: (context) => const MotorWayDriving());

                    Navigator.pushAndRemoveUntil(
                      context,
                      newRoute,
                          (Route<dynamic> route) =>
                      false, // Removes all previous routes
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
        },
      ),
    );
  }
}
