import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'driving_night.dart';

class WindyWeather extends StatefulWidget {
  const WindyWeather({super.key});

  @override
  State<WindyWeather> createState() => _WindyWeatherState();
}

class _WindyWeatherState extends State<WindyWeather> {
  IntroductionController? _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<IntroductionController>(context, listen: false);
    _controller?.getWindyWeather();
    return  Scaffold(
      appBar: AppBar(
        title: Text("Windy Weather"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IntroductionController>(builder: (BuildContext context, value, Widget? child) {
        final data = value.windyModel;
        return Column(
          children: [
            createHeadingText(data!.title),
            buildImage(data.image),
            createAutoSizeText(data.subtitle),
            Container(
              child: Column(
                children: [
                  buildBulletText(data.points[0]),
                  buildBulletText(data.points[1]),
                  buildBulletText(data.points[2]),

                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Route newRoute = MaterialPageRoute(builder: (context) => const DrivingNight());

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
      },),
    );
  }
}
