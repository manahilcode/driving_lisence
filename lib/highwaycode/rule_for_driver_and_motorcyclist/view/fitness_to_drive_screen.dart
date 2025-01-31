import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/fitness_to_drive_controller.dart';

class FitnessToDriveScreenHighway extends StatefulWidget {
  const FitnessToDriveScreenHighway({super.key});

  @override
  State<FitnessToDriveScreenHighway> createState() => _FitnessToDriveScreenHighwayState();
}

class _FitnessToDriveScreenHighwayState extends State<FitnessToDriveScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<FitnessToDriveProvider>(context, listen: false);
          provider.fetchFitnessToDriveData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Fitness to Drive", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<FitnessToDriveProvider>(
          builder: (context,provider,child) {
            final data = provider.fitnessToDriveData;
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
                    createAutoSizeText(data.text1),
                    Gap(10),
                    createAutoSizeText(data.text2),
                    Gap(10),
                    Column(
                      children: data.text3.map((e) => buildBulletText(e.toString())).toList(),
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
