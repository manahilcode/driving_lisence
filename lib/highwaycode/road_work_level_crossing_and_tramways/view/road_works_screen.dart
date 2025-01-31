import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/road_works_controller.dart';

class RoadWorksScreenHighway extends StatefulWidget {
  const RoadWorksScreenHighway({super.key});

  @override
  State<RoadWorksScreenHighway> createState() => _RoadWorksScreenHighwayState();
}

class _RoadWorksScreenHighwayState extends State<RoadWorksScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwaycodeRoadWorksProvider>(context, listen: false);
          provider.fetchHighwaycodeRoadWorksData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Road Works", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwaycodeRoadWorksProvider>(
          builder: (context,provider,child) {
            final data = provider.roadWorksData;
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
                      children: data.points.map((e)=> buildBulletText(e.toString())).toList(),
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
