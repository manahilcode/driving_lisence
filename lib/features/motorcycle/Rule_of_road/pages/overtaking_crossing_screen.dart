import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../repo/over_taking_crossing.dart';
import '../viewmodel/overtaking_crossing.dart';

class OvertakingCrossingScreen extends StatefulWidget {
  const OvertakingCrossingScreen({super.key});

  @override
  State<OvertakingCrossingScreen> createState() => _OvertakingCrossingScreenState();
}

class _OvertakingCrossingScreenState extends State<OvertakingCrossingScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<OvertakingCrossingsNotifier>(context, listen: false);
      provider.loadOvertakingCrossings("Animals_on_the_road");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Overtaking crossing", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<OvertakingCrossingsNotifier>(
          builder: (context,provider,child) {
            final data = provider!.data;
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
                createAutoSizeText(data.title1),
                createAutoSizeText(data.subtitle1),
                buildImage(data.image1),
                createAutoSizeText(data.tip),
                buildImage(data.image2),

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
