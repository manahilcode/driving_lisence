import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/horse_rider_controller.dart';

class HorseRiderScreenHighway extends StatefulWidget {
  const HorseRiderScreenHighway({super.key});

  @override
  State<HorseRiderScreenHighway> createState() => _HorseRiderScreenHighwayState();
}

class _HorseRiderScreenHighwayState extends State<HorseRiderScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayHorseRidersProvider>(context, listen: false);
          provider.fetchHighwayHorseRidersData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Horse Riders", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayHorseRidersProvider>(
          builder: (context,provider,child) {
            final data = provider.horseRidersData;
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
                      children: data.text2.map((e) =>buildBulletText(e.toString()) ).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: [
                        createAutoSizeText(data.text1[0]),
                        Gap(10),
                        createAutoSizeText(data.text1[1]),
                        Gap(10),
                        buildImage(data.text1[2])
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
