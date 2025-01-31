import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../introduction/viewmodel/wording_of_highway_code_controller.dart';
import '../viewmodel/general_guidance_controller.dart';

class GeneralGuidanceScreenHighway extends StatefulWidget {
  const GeneralGuidanceScreenHighway({super.key});

  @override
  State<GeneralGuidanceScreenHighway> createState() => _GeneralGuidanceScreenHighwayState();
}

class _GeneralGuidanceScreenHighwayState extends State<GeneralGuidanceScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeGeneralGuidanceProvider>(context, listen: false);
          provider.fetchGuidance();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "General Guidance", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeGeneralGuidanceProvider>(
          builder: (context,provider,child) {
            final data = provider.guidance;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.text1 ?? ""),
                    Gap(10),
                    createAutoSizeText(data.text2 ?? ""),
                    Gap(10),
                    createAutoSizeText(data.text3 ?? ""),
                    Gap(10),
                    Column(
                      children: data.text4!.map((e)=> buildBulletText(e.toString())).toList(),
                    ),

                    Gap(10),
                    Column(
                      children: data.text5!.map((e)=> buildBulletText(e.toString())).toList(),
                    ),

                    Gap(10),
                    Column(
                      children: data.text6!.map((e)=> buildBulletText(e.toString())).toList(),
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
