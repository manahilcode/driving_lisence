import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/lane_discipline_controller.dart';

class LaneDisciplineScreenHighway extends StatefulWidget {
  const LaneDisciplineScreenHighway({super.key});

  @override
  State<LaneDisciplineScreenHighway> createState() => _LaneDisciplineScreenHighwayState();
}

class _LaneDisciplineScreenHighwayState extends State<LaneDisciplineScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayLaneDisciplineProvider>(context, listen: false);
          provider.loadHighwayLaneDisciplineData("highwaycode_Motorways","Lane discipline");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Lane discipline", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayLaneDisciplineProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayLaneDisciplineData;
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
                      children: data.text1.map((e) => buildBulletText(e.toString())).toList(),
                    )

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
