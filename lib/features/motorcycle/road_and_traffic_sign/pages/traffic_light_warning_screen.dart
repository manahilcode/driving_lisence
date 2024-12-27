import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/traffic_light_warning.dart';

class TrafficLightWarningScreen extends StatefulWidget {
  const TrafficLightWarningScreen({super.key});

  @override
  State<TrafficLightWarningScreen> createState() => _TrafficLightWarningScreenState();
}

class _TrafficLightWarningScreenState extends State<TrafficLightWarningScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BreakdownProvider>(context, listen: false);
      provider.fetchBreakdown("Animals_on_the_road");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<TrafficLightsWarningNotifier>(
          builder: (context,provider,child) {
            final data = provider.trafficLightsWarning;
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
                    children: [
                      createAutoSizeText(data.image1[0]),
                      buildImage(data.image1[1]),
                    ],
                  ),
                Column(
                  children: [
                    createAutoSizeText(data.image2[0]),
                    buildImage(data.image2[1]),
                  ],
                ),
                Column(
                  children: [
                    createAutoSizeText(data.image3[0]),
                    buildImage(data.image3[1]),
                  ],
                ),
                Column(
                  children: [
                    createAutoSizeText(data.image4[0]),
                    buildImage(data.image4[1]),
                  ],
                ),

                Column(
                  children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
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
          }
      ),
    );
  }
}
