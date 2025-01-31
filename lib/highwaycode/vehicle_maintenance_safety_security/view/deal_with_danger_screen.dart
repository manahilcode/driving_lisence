import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/deal_with_danger_controller.dart';

class DealWithDangerScreenHighway extends StatefulWidget {
  const DealWithDangerScreenHighway({super.key});

  @override
  State<DealWithDangerScreenHighway> createState() => _DealWithDangerScreenHighwayState();
}

class _DealWithDangerScreenHighwayState extends State<DealWithDangerScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeDealWithDangerProvider>(context, listen: false);
          provider.fetchDealWithDangerDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Deal with danger", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeDealWithDangerProvider>(
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
