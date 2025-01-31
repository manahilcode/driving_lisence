import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/junction_controlled_by_traffic_lights_controller.dart';

class JunctionControlledByTrafficLightsScreenHighway extends StatefulWidget {
  const JunctionControlledByTrafficLightsScreenHighway({super.key});

  @override
  State<JunctionControlledByTrafficLightsScreenHighway> createState() => _JunctionControlledByTrafficLightsScreenHighwayState();
}

class _JunctionControlledByTrafficLightsScreenHighwayState extends State<JunctionControlledByTrafficLightsScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<JunctionsControlledByTrafficLightsProvider>(context, listen: false);
          provider.fetchJunctionsData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Junction Controlled By Traffic Lights", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<JunctionsControlledByTrafficLightsProvider>(
          builder: (context,provider,child) {
            final data = provider.junctionsData;
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
                    buildImage(data.image),
                    Gap(10),
                    createAutoSizeText(data.text1),
                    Gap(10),
                    Column(
                      children: data.text2.map((e) => buildBulletText(e.toString())).toList(),
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
