import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/crossing_controller.dart';

class CrossingScreenHighway extends StatefulWidget {
  const CrossingScreenHighway({super.key});

  @override
  State<CrossingScreenHighway> createState() => _CrossingScreenHighwayState();
}

class _CrossingScreenHighwayState extends State<CrossingScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCrossingProvider>(context, listen: false);
          provider.fetchHighwayCrossingData("Crossings");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Crossing", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCrossingProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayCrossing;
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


                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
