import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/moped_licence_requirement1_controller.dart';

class MopedLicenceRequirement1ScreenHighway extends StatefulWidget {
  const MopedLicenceRequirement1ScreenHighway({super.key});

  @override
  State<MopedLicenceRequirement1ScreenHighway> createState() => _MopedLicenceRequirement1ScreenHighwayState();
}

class _MopedLicenceRequirement1ScreenHighwayState extends State<MopedLicenceRequirement1ScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<MopedLicenseRequirementsProvider>(context, listen: false);
          provider.fetchMopedLicenseRequirements();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Moped Licence Requirement", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<MopedLicenseRequirementsProvider>(
          builder: (context,provider,child) {
            final data = provider.mopedLicenseRequirements;
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
                      children: data.points!.map((e)=>createAutoSizeText(e.toString())).toList(),
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
