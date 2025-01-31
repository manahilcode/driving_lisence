import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/act_regulation_prior_controller.dart';

class ActRegulationPriorScreenHighway extends StatefulWidget {
  const ActRegulationPriorScreenHighway({super.key});

  @override
  State<ActRegulationPriorScreenHighway> createState() => _ActRegulationPriorScreenHighwayState();
}

class _ActRegulationPriorScreenHighwayState extends State<ActRegulationPriorScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<ActsAndRegulationsPriorTo1988Provider>(context, listen: false);
          provider.fetchActsAndRegulationsData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Act and Regulation Prior to 1988", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<ActsAndRegulationsPriorTo1988Provider>(
          builder: (context,provider,child) {
            final data = provider.data;
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
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
