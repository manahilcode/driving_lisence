import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/vulnurable_road_user/pages/pedestrain_crossing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/pedestrain_provider.dart';

class PedestrainScreen extends StatefulWidget {
  const PedestrainScreen({super.key});

  @override
  State<PedestrainScreen> createState() => _PedestrainScreenState();
}

class _PedestrainScreenState extends State<PedestrainScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<PedestrianProvider>(context, listen: false);
      provider.fetchPedestrianData("Pedestrians");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "pedestrian", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<PedestrianProvider>(
          builder: (context,provider,child) {
            final data = provider.data;
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
                    buildImage(data.image1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildTipWidget(data.tip),
                    ),
                    Gap(20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PedestrainCrossingScreen(), // Replace with your next screen
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
