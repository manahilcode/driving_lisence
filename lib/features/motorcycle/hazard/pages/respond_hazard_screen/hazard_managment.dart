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

          return Column(

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

              buildTipWidget(data.tip),

            ],
          );
        }
      ),
    );
  }
}
