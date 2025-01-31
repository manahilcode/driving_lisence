import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/speed_limit_controller.dart';

class SpeedLimitScreenHighway extends StatefulWidget {
  const SpeedLimitScreenHighway({super.key});

  @override
  State<SpeedLimitScreenHighway> createState() => _SpeedLimitScreenHighwayState();
}

class _SpeedLimitScreenHighwayState extends State<SpeedLimitScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwaySpeedLimitsProvider>(context, listen: false);
          provider.fetchHighwaySpeedLimits("Speed limits");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "speed limit", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwaySpeedLimitsProvider>(
          builder: (context,provider,child) {
            final data = provider.highwaySpeedLimits;
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
                      children: data.text.map((e)=>buildBulletText(e.toString())).toList(),

                    ),
                    Gap(10),
                    Column(
                      children: data.text1.map((e)=>buildBulletText(e.toString())).toList(),

                    ),
                    Gap(10),
                    buildImage(data.image),
                    Gap(10),
                    buildImage(data.image1),
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
