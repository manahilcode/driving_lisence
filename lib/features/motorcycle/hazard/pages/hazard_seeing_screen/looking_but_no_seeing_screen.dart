import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/hazard/pages/hazard_seeing_screen/scanning_Screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/loader.dart';
import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../viewmodel/looking_seeing_provider.dart';

class LookingButNoSeeingScreen extends StatefulWidget {
  const LookingButNoSeeingScreen({super.key});

  @override
  State<LookingButNoSeeingScreen> createState() => _LookingButNoSeeingScreenState();
}

class _LookingButNoSeeingScreenState extends State<LookingButNoSeeingScreen> {
  @override
  void initState() {
    // Future.microtask(() {
    //   final controller = Provider.of<LookingButNotSeeingProvider>(
    //       context,
    //       listen: false);
    //   controller.fetchLookingButNotSeeing(
    //       "motorcycle_seeing_hazard", "Looking_but_not_seeing");
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      final controller = Provider.of<LookingButNotSeeingProvider>(
          context,
          listen: false);
      controller.fetchLookingButNotSeeing(
          "motorcycle_seeing_hazard", " Looking_but_not_seeing");
    });
    return  Scaffold(
      appBar: CustomAppBar(title: "Looking But not seeing ", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
        Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

        Navigator.pushAndRemoveUntil(
          context,
          newRoute,
              (Route<dynamic> route) => false, // Removes all previous routes
        );
      }),
      body:Consumer<LookingButNotSeeingProvider>(
        builder: (context,provider,child) {
          final data = provider.lookingModels;
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
                  createAutoSizeText(data.subtitle),
                  Gap(10),
                  buildImage(data.image),
                  Gap(10),
                  createAutoSizeText(data.subtitle1),
                  Gap(10),
              
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const MotorcycleHazardPerceptionScreen());
              
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
        }
      ),
    );
  }
}
