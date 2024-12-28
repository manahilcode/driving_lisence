import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/hazardAwareness/pages/static_hazard_screen.dart';
import 'package:driving_lisence/features/motorcycle/hazardAwareness/viewmodel/hazard_awarness1_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../hazard/viewmodel/hazard_provider.dart';

class HazardAwarness1Screen extends StatefulWidget {
  const HazardAwarness1Screen({super.key});

  @override
  State<HazardAwarness1Screen> createState() => _HazardAwarness1ScreenState();
}

class _HazardAwarness1ScreenState extends State<HazardAwarness1Screen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MotorcycleHazardProviderAwareness>(context, listen: false);
      provider.loadMotorcycleHazards();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
          title: "Alertness",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {},
      ),

      body: Consumer<MotorcycleHazardProviderAwareness>(
        builder: (context,provider,child) {
          final data = provider.hazards;
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
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaticHazardScreen(), // Replace with your next screen
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
