import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/roundabout_controller.dart';

class RoundaboutScreenHighway extends StatefulWidget {
  const RoundaboutScreenHighway({super.key});

  @override
  State<RoundaboutScreenHighway> createState() => _RoundaboutScreenHighwayState();
}

class _RoundaboutScreenHighwayState extends State<RoundaboutScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayRoundaboutsProvider>(context, listen: false);
          provider.fetchData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "roundabout", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayRoundaboutsProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayRoundaboutsData;
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
                    buildImage(data.image),
                    Gap(10),
                    Column(
                      children: data.text.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text2.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.points1.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.points2.map((e)=>buildBulletText(e.toString())).toList(),
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
