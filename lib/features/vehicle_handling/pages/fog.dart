import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/pages/very_bad_weather.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../viewmodel/controller.dart';

class FogScreen extends StatefulWidget {
  const FogScreen({super.key});

  @override
  State<FogScreen> createState() => _FogScreenState();
}

class _FogScreenState extends State<FogScreen> {
  IntroductionController? _controller;
  @override
  void didChangeDependencies() async{
    _controller = Provider.of<IntroductionController>(context, listen: false);
    await _controller?.getFogData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fog"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IntroductionController>(builder: (context, value, child) {
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child:  ListView.builder(
            itemCount: _controller?.fogModels.length,
            itemBuilder: (BuildContext context, int index) {
              final data = _controller!.fogModels[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  createHeadingText(_controller!.fogModels[index].title),
                  createAutoSizeText(data.subtitle),
                  buildImage(data.image),
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
                  createAutoSizeText(data.subtitle2),
                  buildTipWidget(data.tip),
                  createAutoSizeText(data.points2[0]),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data.points2[1]),
                        buildBulletText(data.points2[2]),
                      ],
                    ),
                  ),
                  Gap(10),
                  createHeadingText(data.question),
                  Gap(10),
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
                  createHeadingText("Correct"),
                  createAutoSizeText(data.correctAnswer),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const VeryBadWeather());

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
              );
            },
          ),
        );
      }),
    );
  }
}
