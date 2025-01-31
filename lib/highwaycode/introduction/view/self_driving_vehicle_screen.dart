import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/self_driving_vehicle_controller.dart';

class SelfDrivingVehicleScreenHighway extends StatefulWidget {
  const SelfDrivingVehicleScreenHighway({super.key});

  @override
  State<SelfDrivingVehicleScreenHighway> createState() => _SelfDrivingVehicleScreenHighwayState();
}

class _SelfDrivingVehicleScreenHighwayState extends State<SelfDrivingVehicleScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<SelfDrivingProvider>(context, listen: false);
          provider.loadSelfDrivingData("highwaycode_introduction","Self-driving vehicles");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Self-driving vehicles", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<SelfDrivingProvider>(
          builder: (context,provider,child) {
            final data = provider.selfDrivingData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.text),
                    Gap(10),
                    createAutoSizeText(data.text1),
                    Gap(10),
                    createAutoSizeText(data.text2),
                    Gap(10),
                    Column(
                      children: data.points.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
