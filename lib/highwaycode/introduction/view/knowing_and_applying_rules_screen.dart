import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/knowing_and_applying_rules_controller.dart';

class KnowingAndApplyingRulesScreenHighway extends StatefulWidget {
  const KnowingAndApplyingRulesScreenHighway({super.key});

  @override
  State<KnowingAndApplyingRulesScreenHighway> createState() => _KnowingAndApplyingRulesScreenHighwayState();
}

class _KnowingAndApplyingRulesScreenHighwayState extends State<KnowingAndApplyingRulesScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<KnowingAndApplyingRulesController>(context, listen: false);
          provider.loadRule("highwaycode_introduction", "Knowing and applying the rules");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Knowing and applying the rules", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<KnowingAndApplyingRulesController>(
          builder: (context,provider,child) {
            final data = provider.rule;
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
