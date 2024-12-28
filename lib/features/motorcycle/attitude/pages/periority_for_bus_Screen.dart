import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/attitude/pages/pedestrain_crossing_screen.dart';
import 'package:driving_lisence/features/motorcycle/vulnurable_road_user/pages/pedestrain_crossing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/priority_for_bus_provider.dart';

class PeriorityForBusScreen extends StatefulWidget {
  const PeriorityForBusScreen({super.key});

  @override
  State<PeriorityForBusScreen> createState() => _PeriorityForBusScreenState();
}

class _PeriorityForBusScreenState extends State<PeriorityForBusScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CrossingInfoProviderAttitude>(context, listen: false);
      provider.fetchCrossingInfo("motorcycle_attitude", "Priority_for_buses");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
          title: "priority for bus",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<CrossingInfoProviderAttitude>(
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
                    buildImage(data.image),
                    createAutoSizeText(data.title1),
                    createAutoSizeText(data.subtitle1),
                    buildImage(data.image1),
                    Gap(10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PedestrainCrossingScreenAttud(), // Replace with your next screen
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
