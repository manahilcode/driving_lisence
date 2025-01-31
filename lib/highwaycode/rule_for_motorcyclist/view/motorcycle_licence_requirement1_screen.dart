import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/motorcycle_licence_requirement1_controller.dart';

class MotorcycleLicenceRequirement1ScreenHighway extends StatefulWidget {
  const MotorcycleLicenceRequirement1ScreenHighway({super.key});

  @override
  State<MotorcycleLicenceRequirement1ScreenHighway> createState() => _MotorcycleLicenceRequirement1ScreenHighwayState();
}

class _MotorcycleLicenceRequirement1ScreenHighwayState extends State<MotorcycleLicenceRequirement1ScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<MotorcycleLicenceRequirements22Provider>(context, listen: false);
          provider.fetchMotorcycleLicenceRequirements22();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "motorcycle licence requirement", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<MotorcycleLicenceRequirements22Provider>(
          builder: (context,provider,child) {
            final data = provider.motorcycleLicenceRequirements22;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.text ?? ""),
                    Gap(10),
                    Column(
                      children: data.text1!.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text2!.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text3!.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text4!.map((e)=>buildBulletText(e.toString())).toList(),
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
