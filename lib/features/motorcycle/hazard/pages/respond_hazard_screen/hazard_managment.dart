import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/loader.dart';
import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../repo/hazard_managment_repo.dart';
import '../../viewmodel/hazard_managment_provider.dart';

class HazardManagment extends StatefulWidget {
  const HazardManagment({super.key});

  @override
  State<HazardManagment> createState() => _HazardManagmentState();
}

class _HazardManagmentState extends State<HazardManagment> {
  @override
  void initState() {
    Future.microtask(() {
      final controller = Provider.of<HazardManagementProvider>(
          context,
          listen: false);
      controller.fetchHazard(
           "Hazard_management");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Hazard Management", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){
        Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

        Navigator.pushAndRemoveUntil(
          context,
          newRoute,
              (Route<dynamic> route) => false, // Removes all previous routes
        );
      }),
      body: Consumer<HazardManagementProvider>(
        builder: (context,provider,child) {
          final data  = provider.hazard;
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
                  Gap(10),
                 Container(
                   decoration: BoxDecoration(
              
                   ),
                   child: Column(
                     children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                   ),
              
                 ),
              
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTipWidget(data.tip),
                  ),
                  Gap(20),
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
