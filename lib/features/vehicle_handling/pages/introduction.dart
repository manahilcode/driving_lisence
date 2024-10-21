import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/pages/weather_condition.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class IntroductionVehicleHandling extends StatefulWidget {
  const IntroductionVehicleHandling({super.key});

  @override
  State<IntroductionVehicleHandling> createState() => _IntroductionVehicleHandlingState();
}

class _IntroductionVehicleHandlingState extends State<IntroductionVehicleHandling> {
   var _fetchDataFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the future for data fetching in initState

  }


  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDataFuture = Provider.of<IntroductionController>(context, listen: false).fetchImageData();
      print(_fetchDataFuture); // Log the Future to check it
      setState(() {}); // Call setState to update the UI
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Road conditions and vehicle handling"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _fetchDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while data is being fetched
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Handle errors
              return Center(child: Text('Error fetching data: ${snapshot.error}'));
            } else {
              // Data is successfully fetched, access it via the provider
              final value = Provider.of<IntroductionController>(context);

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Gap(10),
                  createHeadingText("Road conditions and vehicle handling"),
                  const Gap(10),
                  createAutoSizeText(value.introductionModel?.title ?? ""),
                  const Gap(10),
                  buildImage(value.introductionModel?.imageUrl ?? ""),
                  const Gap(10),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(value.introductionModel?.points[0] ?? ""),
                        buildBulletText(value.introductionModel?.points[1] ?? ""),
                        buildBulletText(value.introductionModel?.points[2] ?? ""),
                        buildBulletText(value.introductionModel?.points[3] ?? ""),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(builder: (context) => const WeatherCondition());

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
            }
          },
        ),
      ),
    );
  }
}
