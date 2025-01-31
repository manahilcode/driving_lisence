import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/crossing_controller.dart';
import '../viewmodel/crossing_the_road_controller.dart';

class CrossingTheRoadScreenHighway extends StatefulWidget {
  const CrossingTheRoadScreenHighway({super.key});

  @override
  State<CrossingTheRoadScreenHighway> createState() => _CrossingTheRoadScreenHighwayState();
}

class _CrossingTheRoadScreenHighwayState extends State<CrossingTheRoadScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCrossingRoadProvider>(context, listen: false);
          provider.fetchHighwayCrossingData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Crossing the road", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCrossingRoadProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayCrossingData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildImage(data.image),
                    Gap(10),
                    Column(
                      children: data.text1.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text2.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text3.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text4.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text5.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text6.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text7.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text8.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text9.map((e)=> createAutoSizeText(e.toString() ?? "")).toList() ?? [],
                    ),
                    Gap(10),
                    Column(
                      children: data.text10.map((e)=> createAutoSizeText(e.toString() ?? "")).toList() ?? [],
                    ),
                    Gap(10),
                    Column(
                      children: data.text11.map((e)=> createAutoSizeText(e.toString() ?? "")).toList() ?? [],
                    ),
                    Gap(10),
                    Column(
                      children: data.text12.map((e)=> createAutoSizeText(e.toString() ?? "")).toList() ?? [],
                    ),
                    Gap(10),
                    Column(
                      children: data.text13.map((e)=> createAutoSizeText(e.toString() ?? "")).toList() ?? [],
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
