import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/stop_parking_provider.dart';
import 'meeting_standard_screen.dart';

class StopParkingScreen extends StatefulWidget {
  const StopParkingScreen({super.key});

  @override
  State<StopParkingScreen> createState() => _StopParkingScreenState();
}

class _StopParkingScreenState extends State<StopParkingScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<StoppingAndParkingNotifier>(context, listen: false);
      provider.loadStoppingAndParking("motorcycle_Rules_of_the_road","Stopping_and_parking");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Stop parking", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<StoppingAndParkingNotifier>(
          builder: (context,provider,child) {
            final data = provider.stoppingAndParking;
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
                    createAutoSizeText(data.subtitle1),
                    buildTipWidget(data.tip),
                    createAutoSizeText(data.subtitle2),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeetingStandardScreenRule_of_road(), // Replace with your next screen
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
