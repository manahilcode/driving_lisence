import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/motorcycle_licence_requirement_controller.dart';

class MotorcycleLicenceRequirementScreenHighway extends StatefulWidget {
  const MotorcycleLicenceRequirementScreenHighway({super.key});

  @override
  State<MotorcycleLicenceRequirementScreenHighway> createState() => _MotorcycleLicenceRequirementScreenHighwayState();
}

class _MotorcycleLicenceRequirementScreenHighwayState extends State<MotorcycleLicenceRequirementScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<MotorcycleLicenceRequirementsProvider>(context, listen: false);
          provider.fetchMotorcycleLicenceRequirements();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Motorcycle Licence Requirement", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<MotorcycleLicenceRequirementsProvider>(
          builder: (context,provider,child) {
            final data = provider.motorcycleLicenceData;
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
                      children: data.points.map((e)=> createAutoSizeText(e.toString())).toList(),
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
