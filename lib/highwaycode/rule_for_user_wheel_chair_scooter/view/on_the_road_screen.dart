import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/on_the_road_controller.dart';

class OnTheRoadScreenHighway extends StatefulWidget {
  const OnTheRoadScreenHighway({super.key});

  @override
  State<OnTheRoadScreenHighway> createState() => _OnTheRoadScreenHighwayState();
}

class _OnTheRoadScreenHighwayState extends State<OnTheRoadScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCode11Provider>(context, listen: false);
          provider.fetchHighwayCode11Data();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "On the road", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCode11Provider>(
          builder: (context,provider,child) {
            final data = provider.highwayCode11Data;
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
                    createAutoSizeText(data.text2),
                    Gap(10),
                    createAutoSizeText(data.text3),
                    Gap(10),
                    createAutoSizeText(data.text4),
                    Gap(10),
                    createAutoSizeText(data.text5),
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
