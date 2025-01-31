import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/vehicle_maintaince_controller.dart';

class VehicleMaintainceScreenHighway extends StatefulWidget {
  const VehicleMaintainceScreenHighway({super.key});

  @override
  State<VehicleMaintainceScreenHighway> createState() => _VehicleMaintainceScreenHighwayState();
}

class _VehicleMaintainceScreenHighwayState extends State<VehicleMaintainceScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<VehicleMaintenanceProvider>(context, listen: false);
          provider.fetchVehicleMaintenanceDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Vehicle Maintained", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<VehicleMaintenanceProvider>(
          builder: (context,provider,child) {
            final data = provider.document;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.text1),
                    Gap(10),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Gap(10),
                    Column(
                      children: data.text.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Gap(10),
                    Column(
                      children: data.text2.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Gap(10),
                    Column(
                      children: data.type.map((e)=>buildBulletText(e.toString())).toList(),
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
