import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/other_consequence_of_offending_controller.dart';

class OtherConsequenceOfOffendingScreenHighway extends StatefulWidget {
  const OtherConsequenceOfOffendingScreenHighway({super.key});

  @override
  State<OtherConsequenceOfOffendingScreenHighway> createState() => _OtherConsequenceOfOffendingScreenHighwayState();
}

class _OtherConsequenceOfOffendingScreenHighwayState extends State<OtherConsequenceOfOffendingScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<OtherConsequencesOfOffendingProvider>(context, listen: false);
          provider.fetchConsequencesData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Other Consequences of Offending", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<OtherConsequencesOfOffendingProvider>(
          builder: (context,provider,child) {
            final data = provider.otherConsequencesData;
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
