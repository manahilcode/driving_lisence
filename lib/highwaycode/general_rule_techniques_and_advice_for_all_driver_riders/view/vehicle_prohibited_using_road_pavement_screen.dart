import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/vehicle_prohibited_using_road_pavement_controller.dart';

class VehicleProhibitedUsingRoadPavementScreenHighway extends StatefulWidget {
  const VehicleProhibitedUsingRoadPavementScreenHighway({super.key});

  @override
  State<VehicleProhibitedUsingRoadPavementScreenHighway> createState() => _VehicleProhibitedUsingRoadPavementScreenHighwayState();
}

class _VehicleProhibitedUsingRoadPavementScreenHighwayState extends State<VehicleProhibitedUsingRoadPavementScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<ProhibitedVehicleProvider>(context, listen: false);
          provider.getProhibitedVehicleData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "vehicle prohibited using road pavement", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<ProhibitedVehicleProvider>(
          builder: (context,provider,child) {
            final data = provider.vehicleData;
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

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
