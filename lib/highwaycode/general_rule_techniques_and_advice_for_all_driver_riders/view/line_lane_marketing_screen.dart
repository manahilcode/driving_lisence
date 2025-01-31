import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/line_lane_marketing_controller.dart';

class LineLaneMarketingScreen extends StatefulWidget {
  const LineLaneMarketingScreen({super.key});

  @override
  State<LineLaneMarketingScreen> createState() => _LineLaneMarketingScreenState();
}

class _LineLaneMarketingScreenState extends State<LineLaneMarketingScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<LinesAndLaneMarkingsProvider>(context, listen: false);
          provider.fetchLinesAndLaneMarkingsData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Line and Lane Markings", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<LinesAndLaneMarkingsProvider>(
          builder: (context,provider,child) {
            final data = provider.linesAndLaneMarkingsData;
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
                      children: data.text3.map((e)=> buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text4.map((e)=> buildBulletText(e.toString())).toList(),
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
