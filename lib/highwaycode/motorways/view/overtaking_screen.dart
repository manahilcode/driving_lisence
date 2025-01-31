import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/highwaycode/motorways/viewmodel/overtaking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';

class OvertakingScreenHighway extends StatefulWidget {
  const OvertakingScreenHighway({super.key});

  @override
  State<OvertakingScreenHighway> createState() => _OvertakingScreenHighwayState();
}

class _OvertakingScreenHighwayState extends State<OvertakingScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayOvertakingProvider11>(context, listen: false);
          provider.fetchHighwayOvertakingData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Overtaking", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayOvertakingProvider11>(
          builder: (context,provider,child) {
            final data = provider.highwayOvertakingData;
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
                    buildImage(data.image),
                    Gap(10),
                    Column(
                      children: data.text1.map((e) => buildBulletText(e.toString())).toList(),
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
