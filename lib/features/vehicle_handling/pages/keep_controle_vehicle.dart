import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/pages/trafic_claim_road_surface.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';

class KeepControleVehicle extends StatefulWidget {
  const KeepControleVehicle({super.key});

  @override
  State<KeepControleVehicle> createState() => _KeepControleVehicleState();
}

class _KeepControleVehicleState extends State<KeepControleVehicle> {
  IntroductionController? _controller;

  @override
  void didChangeDependencies() async{
    _controller = Provider.of<IntroductionController>(context, listen: false);
    await _controller?.getKeepControlVehicle();
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Keep Control Of Vehicle ",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IntroductionController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.controlVehicleModel;
          if(data == null)
          {
            return const LoadingScreen();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  createHeadingText(data?.title ?? ""),
                  createAutoSizeText(data?.subtitle1 ?? ""),
                  createAutoSizeText(data?.subtitle2 ?? ""),
                  createAutoSizeText(data?.subtitle3 ?? ""),
                  createAutoSizeText(data?.points1[0]?? ""),
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
                          buildBulletText(data?.points1[1]?? ""),
                          buildBulletText(data?.points1[2]?? ""),
                          buildBulletText(data?.points1[3]?? ""),
                          buildBulletText(data?.points1[4]?? ""),
                        ],
                      ),
                    ),
                  ),
                  createAutoSizeText(data?.points2[0]?? ""),
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
                          buildBulletText(data?.points2[1]?? ""),
                          buildBulletText(data?.points2[2]?? ""),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(builder: (context) => const TraficClaimRoadSurface());
              
                      Navigator.pushAndRemoveUntil(
                        context,
                        newRoute,
                            (Route<dynamic> route) => false, // Removes all previous routes
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
