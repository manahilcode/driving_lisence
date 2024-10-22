import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'meeting_with_standard.dart';

class TraficClaimRoadSurface extends StatefulWidget {
  const TraficClaimRoadSurface({super.key});

  @override
  State<TraficClaimRoadSurface> createState() => _TraficClaimRoadSurfaceState();
}

class _TraficClaimRoadSurfaceState extends State<TraficClaimRoadSurface> {
  IntroductionController? _controller;

  @override
  void didChangeDependencies() async {
    _controller = Provider.of<IntroductionController>(context, listen: false);
    await _controller?.getTrafficClaimRoadSurface();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traffic Claiming Road Surface"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IntroductionController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.calmingAndRoadSurface;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data!.title),
                  buildImage(data.image1),
                  createAutoSizeText(data.subtitle1),
                  buildImage(data.image2),
                  createAutoSizeText(data.subtitle2),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTipWidget(data.tip),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const MeetingWithStandard());

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
      ),
    );
  }
}
