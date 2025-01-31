import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/using_the_road_controller.dart';

class UsingTheRoadScreenHighway extends StatefulWidget {
  const UsingTheRoadScreenHighway({super.key});

  @override
  State<UsingTheRoadScreenHighway> createState() => _UsingTheRoadScreenHighwayState();
}

class _UsingTheRoadScreenHighwayState extends State<UsingTheRoadScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayUsingRoadProvider>(context, listen: false);
          provider.fetchHighwayUsingRoad("Using the road");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Using the road", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayUsingRoadProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayUsingRoad;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildImage(data.image),
                    Gap(10),
                    Column(
                      children: data.points.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.points1.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.points3.map((e) => buildBulletText(e.toString())).toList(),
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
