import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/stopping_controller.dart';

class StoppingScreenHighway extends StatefulWidget {
  const StoppingScreenHighway({super.key});

  @override
  State<StoppingScreenHighway> createState() => _StoppingScreenHighwayState();
}

class _StoppingScreenHighwayState extends State<StoppingScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayStoppingProvider>(context, listen: false);
          provider.fetchHighwayStoppingData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Stopping", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayStoppingProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayStoppingData;
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
                    buildImage(data.image),
                    Gap(10),
                    createAutoSizeText(data.text1),
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
