import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/situation_needing_extra_care_controller.dart';

class SituationNeedingExtraCareScreenHighway extends StatefulWidget {
  const SituationNeedingExtraCareScreenHighway({super.key});

  @override
  State<SituationNeedingExtraCareScreenHighway> createState() => _SituationNeedingExtraCareScreenHighwayState();
}

class _SituationNeedingExtraCareScreenHighwayState extends State<SituationNeedingExtraCareScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<SituationsNeedingExtraCareProvider>(context, listen: false);
          provider.fetchSituationsNeedingExtraCare();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Situations needing extra care", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<SituationsNeedingExtraCareProvider>(
          builder: (context,provider,child) {
            final data = provider.situationsNeedingExtraCare;
            if(data == null)
            {
              return LoadingScreen();
            }
            return Column(
              children: [
              ],
            );
          }
      ),
    );
  }
}
