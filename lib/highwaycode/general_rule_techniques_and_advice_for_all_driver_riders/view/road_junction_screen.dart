import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/road_junction_controller.dart';

class RoadJunctionScreenHighway  extends StatefulWidget {
  const RoadJunctionScreenHighway ({super.key});

  @override
  State<RoadJunctionScreenHighway > createState() => _RoadJunctionScreenHighwayState();
}

class _RoadJunctionScreenHighwayState extends State<RoadJunctionScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<RoadJunctionsProvider>(context, listen: false);
          provider.fetchData();
        }


    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "road junction", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<RoadJunctionsProvider>(
          builder: (context,provider,child) {
            final data = provider.roadJunctionsData;
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
                      children: data.points.map((e)=> buildBulletText(e.toString())).toList(),
                    ),

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
