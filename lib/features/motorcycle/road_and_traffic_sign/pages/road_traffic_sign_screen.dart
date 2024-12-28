import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/road_and_traffic_sign/pages/sign_screen.dart';
import 'package:driving_lisence/features/motorcycle/road_and_traffic_sign/viewmodel/road_traffic_sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../hazardAwareness/viewmodel/road_sign_provider.dart';

class RoadTrafficSignScreen extends StatefulWidget {
  const RoadTrafficSignScreen({super.key});

  @override
  State<RoadTrafficSignScreen> createState() => _RoadTrafficSignScreenState();
}

class _RoadTrafficSignScreenState extends State<RoadTrafficSignScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<RoadSignsProviderRoadTraffic>(context, listen: false);
      provider.loadRoadSignsData("motorcycle_Road_and_traffic_signs", "Road and traffic signs");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Road Traffic Sign", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<RoadSignsProviderRoadTraffic>(
          builder: (context,provider,child) {
            final data = provider!.roadSignsData;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Column(
              children: [
                 createHeadingText(data.title),
                buildImage(data.image),
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
                          builder: (context) => SignScreen(), // Replace with your next screen
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
            );
          }
      ),
    );
  }
}
