import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/horse_drawn_vehicle_controller.dart';

class HorseDrawnVehicleScreenHighway extends StatefulWidget {
  const HorseDrawnVehicleScreenHighway({super.key});

  @override
  State<HorseDrawnVehicleScreenHighway> createState() => _HorseDrawnVehicleScreenHighwayState();
}

class _HorseDrawnVehicleScreenHighwayState extends State<HorseDrawnVehicleScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HorseDrawnVehiclesProvider>(context, listen: false);
          provider.fetchHorseDrawnVehiclesData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Horse Drawn Vehicle", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HorseDrawnVehiclesProvider>(
          builder: (context,provider,child) {
            final data = provider.horseDrawnVehiclesData;
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
                    Column(
                       children: [
                         createAutoSizeText(data.text1[0]),
                         Gap(10),
                         createAutoSizeText(data.text1[1]),

                       ],
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
