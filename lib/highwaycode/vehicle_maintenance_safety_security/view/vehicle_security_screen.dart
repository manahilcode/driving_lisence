import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/vehicle_security_controller.dart';

class VehicleSecurityScreenHighway extends StatefulWidget {
  const VehicleSecurityScreenHighway({super.key});

  @override
  State<VehicleSecurityScreenHighway> createState() => _VehicleSecurityScreenHighwayState();
}

class _VehicleSecurityScreenHighwayState extends State<VehicleSecurityScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<VehicleSecurityProvider>(context, listen: false);
          provider.fetchVehicleSecurityDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Vehicle Security", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<VehicleSecurityProvider>(
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
                   Column(
                     children: data.points.map((e)=>createAutoSizeText(e.toString())).toList(),

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
