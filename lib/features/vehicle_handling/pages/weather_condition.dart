import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/pages/fog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class WeatherCondition extends StatefulWidget {
  const WeatherCondition({super.key});

  @override
  State<WeatherCondition> createState() => _WeatherConditionState();
}

class _WeatherConditionState extends State<WeatherCondition> {

var futureData;
  @override
  void didChangeDependencies() async{
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<IntroductionController>(context, listen: false).getWeatherCondition();

    });

    await Provider.of<IntroductionController>(context, listen: false).getWeatherCondition();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Condition"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IntroductionController>(
        builder: (context, value, child) {
          if (value.weatherCondition != null) {
            final data = value.weatherCondition;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createHeadingText(data!.title),
                    createAutoSizeText(data.subtitle!),
                    createHeadingText(data.title2),
                    createAutoSizeText(data.subtitle2!),
                    const Gap(10),
                    createAutoSizeText(data.question),
                    const Gap(10),
                    Column(
                      children: data.answers.entries.map((entry) {
                        // `entry.key` gives you the key (e.g., "1", "2", ...)
                        // `entry.value` gives you the answer (e.g., "Flash your headlights as a warning")
                        return Container(
                          child: ListTile(
                            horizontalTitleGap: 0,
                            leading: Text(
                              entry.key, // Display the key
                              style: TextStyle(),
                            ),
                            title: Container(
                              padding: EdgeInsets.only(
                                  top: 08, bottom: 08, left: 08, right: 08),
                              decoration: BoxDecoration(
                                  color: Colors.white, // Background color
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.grey)),
                              child: Text(
                                entry.value, // Display the answer
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    createAutoSizeText(data.correctAnswer),

                    buildImage(data.imageUrl),

                    createAutoSizeText(data.subtitle3!),
                    createAutoSizeText(data.points[0]),

                    Padding(
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
                            buildBulletText(data.points[1]),
                            buildBulletText(data.points[2]),
                            buildBulletText(data.points[3]),

                          ],
                        ),
                      ),
                    ),


                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Route newRoute = MaterialPageRoute(builder: (context) => const FogScreen());

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
          } else {
            return Column(
              children: [
                const Center(child: CircularProgressIndicator()),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(builder: (context) => const FogScreen());

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
            ); // Show a loading indicator while fetching data
          }
        },
      ),

    );
  }
}
