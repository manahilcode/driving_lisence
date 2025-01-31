
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/safety_code_for_driver_controller.dart';

class SafetyCodeForDriverScreenHighway extends StatefulWidget {
  const SafetyCodeForDriverScreenHighway({super.key});

  @override
  State<SafetyCodeForDriverScreenHighway> createState() => _SafetyCodeForDriverScreenHighwayState();
}

class _SafetyCodeForDriverScreenHighwayState extends State<SafetyCodeForDriverScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<SafetyCodeProvider>(context, listen: false);
          provider.fetchSafetyCodeDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Safety Code for New Drivers", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<SafetyCodeProvider>(
          builder: (context,provider,child) {
            final data = provider.document;
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
                    createAutoSizeText(data.text3),
                    Gap(10),
                    createAutoSizeText(data.text4),
                    Gap(10),
                    createAutoSizeText(data.text5),
                    Gap(10),
                    createAutoSizeText(data.text6),
                    Gap(10),
                    createAutoSizeText(data.text7),
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
