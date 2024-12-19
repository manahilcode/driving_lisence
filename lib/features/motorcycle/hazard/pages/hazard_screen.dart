import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
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


          return Column(
            children: [
              createHeadingText(provider.motorcycleHazard?.title ?? ""),
              createAutoSizeText(provider.motorcycleHazard?.subtitle ?? ""),
              buildImage(provider.motorcycleHazard?.image ?? "")
            ],
          );
        }
      ),
    );
  }
}
