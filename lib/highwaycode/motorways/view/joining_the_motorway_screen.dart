import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/joining_the_motorway_controller.dart';

class JoiningTheMotorwayScreenHighway extends StatefulWidget {
  const JoiningTheMotorwayScreenHighway({super.key});

  @override
  State<JoiningTheMotorwayScreenHighway> createState() => _JoiningTheMotorwayScreenHighwayState();
}

class _JoiningTheMotorwayScreenHighwayState extends State<JoiningTheMotorwayScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<JoiningMotorwayProvider>(context, listen: false);
          provider.loadJoiningMotorwayData("highwaycode_Motorways","Joining the motorway");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Joining the motorway", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<JoiningMotorwayProvider>(
          builder: (context,provider,child) {
            final data = provider.joiningMotorwayData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.header),
                    Gap(10),
                    Column(
                      children: data.points.map((e) => buildBulletText(e.toString())).toList(),


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
