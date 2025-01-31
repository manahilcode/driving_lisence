import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/riding_controller.dart';

class RidingScreenHighway extends StatefulWidget {
  const RidingScreenHighway({super.key});

  @override
  State<RidingScreenHighway> createState() => _RidingScreenHighwayState();
}

class _RidingScreenHighwayState extends State<RidingScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeRidingProvider>(context, listen: false);
          provider.fetchHighwayCodeRidingData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Riding", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeRidingProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayCodeRidingData;
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
                    createAutoSizeText(data.text2),
                    Gap(10),
                    createAutoSizeText(data.text3),
                    Gap(10),
                    Column(
                      children: data.text1.map((e)=>buildBulletText(e.toString())).toList(),
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
