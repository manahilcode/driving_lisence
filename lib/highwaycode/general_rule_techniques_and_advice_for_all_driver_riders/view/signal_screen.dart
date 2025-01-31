import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/signal_controller.dart';

class SignalScreenHighway extends StatefulWidget {
  const SignalScreenHighway({super.key});

  @override
  State<SignalScreenHighway> createState() => _SignalScreenHighwayState();
}

class _SignalScreenHighwayState extends State<SignalScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwaySignalsProvider>(context, listen: false);
          provider.fetchHighwaySignals("Signals");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "signal", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwaySignalsProvider>(
          builder: (context,provider,child) {
            final data = provider.highwaySignals;
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
                      children: data.text.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    createAutoSizeText(data.text1),
                    Gap(10),
                    Column(
                      children: data.text2.map((e)=>buildBulletText(e.toString())).toList(),
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
