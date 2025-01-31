import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/provide_emergency_care_controller.dart';

class ProvideEmergencyCareScreenHighway extends StatefulWidget {
  const ProvideEmergencyCareScreenHighway({super.key});

  @override
  State<ProvideEmergencyCareScreenHighway> createState() => _ProvideEmergencyCareScreenHighwayState();
}

class _ProvideEmergencyCareScreenHighwayState extends State<ProvideEmergencyCareScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<ProvideEmergencyCareProvider>(context, listen: false);
          provider.fetchEmergencyCareDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Provide Emergency Care", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<ProvideEmergencyCareProvider>(
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
