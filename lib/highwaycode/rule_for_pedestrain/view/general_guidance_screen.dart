import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
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
          final provider = Provider.of<HighwayCodeProvider1245>(context, listen: false);
          provider.fetchHighwayCodeGeneralGuidance();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "General Guidance", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeProvider1245>(
          builder: (context,provider,child) {
            final data = provider.highwayCodeGeneralGuidance;
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
                      children: data.text.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text1.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text2.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),

                    Gap(10),
                    Column(
                      children: data.text4.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text5.map((e)=> createAutoSizeText(e.toString())).toList(),
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
