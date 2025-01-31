import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/moped_licence_requirement_controller.dart';

class MopedLicenceRequirementScreenHighway extends StatefulWidget {
  const MopedLicenceRequirementScreenHighway({super.key});

  @override
  State<MopedLicenceRequirementScreenHighway> createState() => _MopedLicenceRequirementScreenHighwayState();
}

class _MopedLicenceRequirementScreenHighwayState extends State<MopedLicenceRequirementScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<MopedLicenceRequirements11Provider>(context, listen: false);
          provider.fetchMopedLicenceRequirements11();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Moped Licence Requirement", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<MopedLicenceRequirements11Provider>(
          builder: (context,provider,child) {
            final data = provider.mopedLicenceRequirements11;
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
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
