import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/learner_drivers_controller.dart';

class LearnerDriversScreenHighway extends StatefulWidget {
  const LearnerDriversScreenHighway({super.key});

  @override
  State<LearnerDriversScreenHighway> createState() => _LearnerDriversScreenHighwayState();
}

class _LearnerDriversScreenHighwayState extends State<LearnerDriversScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeLearnerDriversProvider>(context, listen: false);
          provider.fetchLearnerDriverInfo();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Learner Drivers", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeLearnerDriversProvider>(
          builder: (context,provider,child) {
            final data = provider.learnerDriverInfo;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.text ??"")
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
