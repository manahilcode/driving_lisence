import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/leaving_the_motorway_controller.dart';

class LeavingTheMotorwayScreenHighway extends StatefulWidget {
  const LeavingTheMotorwayScreenHighway({super.key});

  @override
  State<LeavingTheMotorwayScreenHighway> createState() => _LeavingTheMotorwayScreenHighwayState();
}

class _LeavingTheMotorwayScreenHighwayState extends State<LeavingTheMotorwayScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<LeavingMotorwayProvider>(context, listen: false);
          provider.loadLeavingMotorwayData("highwaycode_Motorways","Leaving the motorway");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Leaving the motorway", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<LeavingMotorwayProvider>(
          builder: (context,provider,child) {
            final data = provider.leavingMotorwayData;
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
                      children: data.text1.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    createAutoSizeText(data.text2),
                    Gap(10)

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
