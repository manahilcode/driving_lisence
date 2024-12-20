import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/hazard/pages/static_hazard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../../motorcycle_hazard_perception_screen.dart';
import '../viewmodel/hazard_provider.dart';

class MotorCycleHazardScreen extends StatefulWidget {
  const MotorCycleHazardScreen({super.key});

  @override
  State<MotorCycleHazardScreen> createState() => _MotorCycleHazardScreenState();
}

class _MotorCycleHazardScreenState extends State<MotorCycleHazardScreen> {
  
  @override
  void initState() {

  final controller =  Provider.of<MotorcycleHazardProvider>(context,listen: false);
  controller.fetchMotorcycleHazard("motorcycle_hazard", "introduction");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: 'Introduction',
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {
          //MotorcycleHazardPerceptionScreen
          Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

          Navigator.pushAndRemoveUntil(
            context,
            newRoute,
                (Route<dynamic> route) => false, // Removes all previous routes
          );
        },
      ),
      body: Consumer<MotorcycleHazardProvider>(
        builder: (context,provider,child) {
          final data = provider.motorcycleHazard;

          if (data == null) {
            return const Center(
              child: LoadingScreen(),
            );
          }


          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(provider.motorcycleHazard?.title ?? ""),
                createAutoSizeText(provider.motorcycleHazard?.subtitle ?? ""),
                buildImage(provider.motorcycleHazard?.image ?? ""),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(builder: (context) => const StaticHazardScreen());

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
          );
        }
      ),
    );
  }
}
