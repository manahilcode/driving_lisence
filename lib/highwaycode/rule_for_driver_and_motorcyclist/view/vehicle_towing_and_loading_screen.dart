import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/vehicle_towing_and_loading_controller.dart';

class VehicleTowingAndLoadingScreenHighway extends StatefulWidget {
  const VehicleTowingAndLoadingScreenHighway({super.key});

  @override
  State<VehicleTowingAndLoadingScreenHighway> createState() => _VehicleTowingAndLoadingScreenHighwayState();
}

class _VehicleTowingAndLoadingScreenHighwayState extends State<VehicleTowingAndLoadingScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<VehicleTowingAndLoadingProvider>(context, listen: false);
          provider.fetchVehicleTowingAndLoading();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Vehicle Towing & Loading", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<VehicleTowingAndLoadingProvider>(
          builder: (context,provider,child) {
            final data = provider.vehicleTowingData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.header),
                    Gap(10),
                   Column(
                     children: data.breakdowns.map((e)=>buildBulletText(e.toString())).toList(),
                   ),
                    Gap(10),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
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
