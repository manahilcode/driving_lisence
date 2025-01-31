import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/signal_controll_crossing_controller.dart';

class SignalControllCrossingScreenHighway extends StatefulWidget {
  const SignalControllCrossingScreenHighway({super.key});

  @override
  State<SignalControllCrossingScreenHighway> createState() => _SignalControllCrossingScreenHighwayState();
}

class _SignalControllCrossingScreenHighwayState extends State<SignalControllCrossingScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<SignalControlledCrossingsProvider>(context, listen: false);
          provider.fetchSignalControlledCrossings("Signal-controlled crossings");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "signal control crossing", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<SignalControlledCrossingsProvider>(
          builder: (context,provider,child) {
            final data = provider.signalControlledCrossings;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.text1),
                    Gap(10),
                    createAutoSizeText(data.text2),
                    Gap(10),
                    buildImage(data.image),
                    Gap(10),
                    Column(
                      children: data.text.map((e)=>buildBulletText(e.toString())).toList(),
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
