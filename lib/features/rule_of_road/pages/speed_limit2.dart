import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/rule_of_road/pages/lane_junctions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class SpeedLimit2 extends StatefulWidget {
  const SpeedLimit2({super.key});

  @override
  State<SpeedLimit2> createState() => _SpeedLimit2State();
}

class _SpeedLimit2State extends State<SpeedLimit2> {
  RuleRoadController? _ruleRoadController;
  @override
  void didChangeDependencies() {
    _ruleRoadController =
        Provider.of<RuleRoadController>(context, listen: false);
    _ruleRoadController?.fetchSpeedLimit2();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Speed Limit 2",style: TextStyle(color:Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Consumer<RuleRoadController>(
          builder: (BuildContext context, value, Widget? child) {
            final data = value.speedLimit2Value;
            if (data == null) {
              return const Center(
                  child: CircularProgressIndicator()); // or any placeholder
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildImage(data.image!),
                    createAutoSizeText(data.subtitle!),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Column(
                            children: [
                              createHeadingText(data.selfReflectionTitle!),
                              createAutoSizeText(data.selfReflectionSubtitle!),
                            ],
                          )),
                    ),
                    createAutoSizeText(data.subtitle!),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Column(
                          children: [
                            buildImage(data.image1!),
                            createAutoSizeText(data.imageCaption1!),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Column(
                          children: [
                            buildImage(data.image2!),
                            createAutoSizeText(data!.imageCaption2!),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Column(
                          children: [
                            buildImage(data.image3!),
                            createAutoSizeText(data.imageCaption3!),
                          ],
                        ),
                      ),
                    ),



                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Route newRoute = MaterialPageRoute(
                            builder: (context) => const LaneJunctions());

                        Navigator.pushAndRemoveUntil(
                          context,
                          newRoute,
                          (Route<dynamic> route) =>
                              false, // Removes all previous routes
                        );
                      },
                      child: Center(
                        child: Container(
                          width: 300,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 30.0),
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
                          child: const Center(
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
          },
        ));
  }
}