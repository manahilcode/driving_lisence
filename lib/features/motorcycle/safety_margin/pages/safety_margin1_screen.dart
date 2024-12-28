import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/safety_margin/pages/stopping_distance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/safetymargin1_provider.dart';

class SafetyMargin1Screen extends StatefulWidget {
  const SafetyMargin1Screen({super.key});

  @override
  State<SafetyMargin1Screen> createState() => _SafetyMargin1ScreenState();
}

class _SafetyMargin1ScreenState extends State<SafetyMargin1Screen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SafetyMargin1Notifier>(context, listen: false);
      provider.fetchSafetyMargin1Data();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Safety margin 1", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<SafetyMargin1Notifier>(
          builder: (context,provider,child) {
            final data = provider.data;
            if(data == null)
            {
              return LoadingScreen();
            }

            return Column(
              children: [
                createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                buildImage(data.image),
                createAutoSizeText(data.title1),
                createAutoSizeText(data.subtitle1),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoppingDistanceScreen(), // Replace with your next screen
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
