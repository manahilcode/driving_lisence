import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/flashing_headlight_controller.dart';

class FlashingHeadlightScreenHighway extends StatefulWidget {
  const FlashingHeadlightScreenHighway({super.key});

  @override
  State<FlashingHeadlightScreenHighway> createState() => _FlashingHeadlightScreenHighwayState();
}

class _FlashingHeadlightScreenHighwayState extends State<FlashingHeadlightScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<FlashingHeadlightsProvider>(context, listen: false);
          provider.fetchFlashingHeadlightsData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "flashing headlight", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<FlashingHeadlightsProvider>(
          builder: (context,provider,child) {
            final data = provider.flashingHeadlightsData;
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
                      children: data.text
                          .map((e) => buildBulletText(e.toString()))
                          .toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text1
                          .map((e) => buildBulletText(e.toString()))
                          .toList(),
                    ),
                    Gap(10),
                    Column(

                      )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
