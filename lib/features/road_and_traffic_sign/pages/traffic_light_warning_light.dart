import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/road_and_traffic_sign/pages/signal_given_by_police_drivers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class TrafficLightWarningLight extends StatefulWidget {
  const TrafficLightWarningLight({super.key});

  @override
  State<TrafficLightWarningLight> createState() =>
      _TrafficLightWarningLightState();
}

class _TrafficLightWarningLightState extends State<TrafficLightWarningLight> {
  RoadSignController? _roadSignController;
  @override
  void didChangeDependencies() {
    _roadSignController =
        Provider.of<RoadSignController>(context, listen: false);
    _roadSignController
        ?.fetchTrafficLightAndWarning("traffic_lights_and_warning_lights");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Traffic light and warning light",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<RoadSignController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.trafficLightAndWarning;
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              createHeadingText(data.title),
              buildImage(data.image1),
              createAutoSizeText(data.subtitle1),
              buildImage(data.image2),
              createAutoSizeText(data.image2),
              createAutoSizeText(data.subtitle5),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildBulletText(data.points[0]),
                    buildBulletText(data.points[1]),
                    buildBulletText(data.points[2]),
                    buildBulletText(data.points[3]),
                    createHeadingText(data.subtitle6),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          buildImage(data.image3),
                          createAutoSizeText(data.imageCaption3)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          buildImage(data.image4),
                          createAutoSizeText(data.imageCaption4)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          buildImage(data.image5),
                          createAutoSizeText(data.imageCaption5)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Route newRoute = MaterialPageRoute(builder: (context) => const SignalGivenByPoliceDrivers());

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
          );
        },
      ),
    );
  }
}
