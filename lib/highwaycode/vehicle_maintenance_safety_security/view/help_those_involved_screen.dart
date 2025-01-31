import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/help_those_involved_controller.dart';

class HelpThoseInvolvedScreenHighway extends StatefulWidget {
  const HelpThoseInvolvedScreenHighway({super.key});

  @override
  State<HelpThoseInvolvedScreenHighway> createState() => _HelpThoseInvolvedScreenHighwayState();
}

class _HelpThoseInvolvedScreenHighwayState extends State<HelpThoseInvolvedScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeHelpInvolvedProvider>(context, listen: false);
          provider.fetchHelpInvolvedDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Help those involved", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeHelpInvolvedProvider>(
          builder: (context,provider,child) {
            final data = provider.document;
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
