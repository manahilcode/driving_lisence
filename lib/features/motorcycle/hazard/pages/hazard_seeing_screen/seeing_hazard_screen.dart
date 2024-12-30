import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/loader.dart';
import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../viewmodel/seeing_hazard_provider.dart';
import '../yourself_screen.dart';
import 'factor_effecting.dart';

class SeeingHazardScreen extends StatefulWidget {
  const SeeingHazardScreen({super.key});

  @override
  State<SeeingHazardScreen> createState() => _SeeingHazardScreenState();
}

class _SeeingHazardScreenState extends State<SeeingHazardScreen> {
  @override
  void initState() {
    Future.microtask(() {
      final controller = Provider.of<SeeingHazardProvider>(
          context,
          listen: false);
      controller.fetchModel(
          "motorcycle_seeing_hazard", "Seeing_hazards");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title:"Seeing Hazard" , leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){
        Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());
        Navigator.push(context, newRoute);
      }),
      body: Consumer<SeeingHazardProvider>(
        builder: (context,provider,child) {
          final data = provider.model;
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
                  Gap(10),
                  buildImage(data.image),
                  Gap(10),
                  createAutoSizeText(data.subtitle),
                  Gap(10),
                  createAutoSizeText(data.subtitle1),
                  Gap(10),
                  createAutoSizeText(data.subtitle2),
                  Gap(10),

                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

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
        }
      ),
    );
  }
}
