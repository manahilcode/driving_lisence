import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/learner_driver_controller.dart';

class LearnerDriverScreenHighway extends StatefulWidget {
  const LearnerDriverScreenHighway({super.key});

  @override
  State<LearnerDriverScreenHighway> createState() => _LearnerDriverScreenHighwayState();
}

class _LearnerDriverScreenHighwayState extends State<LearnerDriverScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayLearnerDriverProvider>(context, listen: false);
          provider.fetchLearnerDriverDocuments();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Learner Driver", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayLearnerDriverProvider>(
          builder: (context,provider,child) {
            final data = provider.documents;
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
                    Column(
                      children: data.text1.map((e)=> buildBulletText(e.toString())).toList(),
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
