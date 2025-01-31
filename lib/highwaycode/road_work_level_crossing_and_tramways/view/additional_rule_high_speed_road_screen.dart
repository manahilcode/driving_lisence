import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/additional_rule_high_speed_road_controller.dart';

class AdditionalRuleHighSpeedRoadScreenHighway extends StatefulWidget {
  const AdditionalRuleHighSpeedRoadScreenHighway({super.key});

  @override
  State<AdditionalRuleHighSpeedRoadScreenHighway> createState() => _AdditionalRuleHighSpeedRoadScreenHighwayState();
}

class _AdditionalRuleHighSpeedRoadScreenHighwayState extends State<AdditionalRuleHighSpeedRoadScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<AdditionalRulesHighSpeedRoadsProvider>(context, listen: false);
          provider.fetchHighSpeedRoadRules();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Additional Rules High Speed Roads", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<AdditionalRulesHighSpeedRoadsProvider>(
          builder: (context,provider,child) {
            final data = provider.rulesData;
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
                      children: data.text.map((e)=> buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text1.map((e)=> buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text2.map((e)=> buildBulletText(e.toString())).toList(),
                    ),
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
