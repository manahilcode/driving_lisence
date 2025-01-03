import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/crossroad.dart';
import 'overtaking_crossing_screen.dart';

class CrossroadScreen extends StatefulWidget {
  const CrossroadScreen({super.key});

  @override
  State<CrossroadScreen> createState() => _CrossroadScreenState();
}

class _CrossroadScreenState extends State<CrossroadScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<RidingGuideProvider>(context, listen: false);
      provider.fetchRidingGuideData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "CrossRoad", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<RidingGuideProvider>(
        builder: (context,provider,child) {
          final data = provider!.ridingGuideData;
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
                  buildImage(data.image1),
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
                            builder: (context) => OvertakingCrossingScreen(), // Replace with your next screen
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
