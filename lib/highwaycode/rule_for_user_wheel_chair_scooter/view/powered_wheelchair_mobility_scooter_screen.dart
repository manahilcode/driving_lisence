import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/powered_wheelchair_mobility_scooter_controller.dart';

class PoweredWheelchairMobilityScooterScreenHighway extends StatefulWidget {
  const PoweredWheelchairMobilityScooterScreenHighway({super.key});

  @override
  State<PoweredWheelchairMobilityScooterScreenHighway> createState() => _PoweredWheelchairMobilityScooterScreenHighwayState();
}

class _PoweredWheelchairMobilityScooterScreenHighwayState extends State<PoweredWheelchairMobilityScooterScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<PoweredWheelchairsAndMobilityScootersProvider>(context, listen: false);
          provider.fetchPoweredWheelchairsData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Power Wheelchair/Mobility Scooter", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<PoweredWheelchairsAndMobilityScootersProvider>(
          builder: (context,provider,child) {
            final data = provider.data;
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
