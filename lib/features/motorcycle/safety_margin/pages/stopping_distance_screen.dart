import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/safety_margin/pages/weather_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/stopping_distance_provider.dart';

class StoppingDistanceScreen extends StatefulWidget {
  const StoppingDistanceScreen({super.key});

  @override
  State<StoppingDistanceScreen> createState() => _StoppingDistanceScreenState();
}

class _StoppingDistanceScreenState extends State<StoppingDistanceScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<StoppingDistanceNotifier>(context, listen: false);
      provider.fetchStoppingDistanceData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Stopping distance", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<StoppingDistanceNotifier>(
          builder: (context,provider,child) {
            final data = provider.stoppingDistanceData;
            if(data == null)
            {
              return LoadingScreen();
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createHeadingText(data.title),
                    createAutoSizeText(data.subtitle),
                    buildImage(data.image),
                    createAutoSizeText(data.subtitle1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildTipWidget(data.reflection),
                    ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: buildTipWidget(data.tip),
                     ),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeatherConditionScreen(), // Replace with your next screen
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
