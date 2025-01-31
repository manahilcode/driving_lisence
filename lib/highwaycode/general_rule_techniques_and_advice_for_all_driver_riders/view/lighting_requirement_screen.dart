import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/lighting_requirement_controller.dart';

class LightingRequirementScreenHighway extends StatefulWidget {
  const LightingRequirementScreenHighway({super.key});

  @override
  State<LightingRequirementScreenHighway> createState() => _LightingRequirementScreenHighwayState();
}

class _LightingRequirementScreenHighwayState extends State<LightingRequirementScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<LightingRequirementProvider>(context, listen: false);
          provider.fetchLightingRequirementData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Lighting Requirement", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<LightingRequirementProvider>(
          builder: (context,provider,child) {
            final data = provider.lightingRequirementData;
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
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
