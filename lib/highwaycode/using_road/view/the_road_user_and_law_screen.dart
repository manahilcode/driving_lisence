import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/the_road_user_and_law_controller.dart';

class TheRoadUserAndLawScreenHighway extends StatefulWidget {
  const TheRoadUserAndLawScreenHighway({super.key});

  @override
  State<TheRoadUserAndLawScreenHighway> createState() => _TheRoadUserAndLawScreenHighwayState();
}

class _TheRoadUserAndLawScreenHighwayState extends State<TheRoadUserAndLawScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<RoadUserAndTheLawProvider>(context, listen: false);
          provider.fetchRoadUserAndTheLawData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "The road user and law", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<RoadUserAndTheLawProvider>(
          builder: (context,provider,child) {
            final data = provider.data;
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
                    createAutoSizeText(data.text1),
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
