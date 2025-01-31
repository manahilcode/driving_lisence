import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/on_the_motorway_controller.dart';

class OnTheMotorwayScreenHighway extends StatefulWidget {
  const OnTheMotorwayScreenHighway({super.key});

  @override
  State<OnTheMotorwayScreenHighway> createState() => _OnTheMotorwayScreenHighwayState();
}

class _OnTheMotorwayScreenHighwayState extends State<OnTheMotorwayScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayMotorwayProvider>(context, listen: false);
          provider.fetchHighwayMotorwayData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "On the motorway", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayMotorwayProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayMotorwayData;
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
                      children: data.points.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.points1.map((e) => buildBulletText(e.toString())).toList(),
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
