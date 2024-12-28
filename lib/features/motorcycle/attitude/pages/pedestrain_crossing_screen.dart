import 'package:driving_lisence/core/imagewithtext.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/pedestrain_crossing_provider.dart';
import 'meeting_standard_screen.dart';

class PedestrainCrossingScreenAttud extends StatefulWidget {
  const PedestrainCrossingScreenAttud({super.key});

  @override
  State<PedestrainCrossingScreenAttud> createState() => _PedestrainCrossingScreenAttudState();
}

class _PedestrainCrossingScreenAttudState extends State<PedestrainCrossingScreenAttud> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CrossingProviderAttitudeMotorcycle>(context, listen: false);
      provider.fetchCrossingData("motorcycle_attitude", "Pedestrian_crossings");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
          title: "Pedestrian crossing",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<CrossingProviderAttitudeMotorcycle>(
          builder: (context,provider,child) {
            final data = provider.data;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createHeadingText(data.title),
                    createAutoSizeText(data.subtitle),
                    Column(
                      children: [
                        createAutoSizeText(data.defination[0]),
                        createAutoSizeText(data.defination[1]),
                      ],
                    ),
                
                    Column(
                      children: [
                        createAutoSizeText(data.points[0]),
                        createAutoSizeText(data.points[1]),
                        createAutoSizeText(data.points[2]),
                        createAutoSizeText(data.points[3]),
                        createAutoSizeText(data.points[4]),
                        createAutoSizeText(data.points[5]),
                        buildImage(data.points[6])
                      ],
                     ),

                    Column(
                     children: [
                       createAutoSizeText(data.points1[0]),
                       createAutoSizeText(data.points1[1]),
                       createAutoSizeText(data.points1[2]),
                       createAutoSizeText(data.points1[3]),
                       buildImage(data.points1[4]),
                     ],
                    ),
                    Column(
                      children: [
                        createAutoSizeText(data.points2[0]),
                        createAutoSizeText(data.points2[1]),
                        buildImage(data.points2[2]),
                      ],
                    ),
                    Column(
                      children: [
                        createAutoSizeText(data.points3[0]),
                        createAutoSizeText(data.points3[1]),
                        buildImage(data.points3[2]),
                      ],
                     ),
                    Gap(10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeetingStandardScreenAttitude(), // Replace with your next screen
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
                ),
              ),
            );
          }
      ),
    );
  }
}
