import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/overview_controller.dart';

class OverviewScreenHighway extends StatefulWidget {
  const OverviewScreenHighway({super.key});

  @override
  State<OverviewScreenHighway> createState() => _OverviewScreenHighwayState();
}

class _OverviewScreenHighwayState extends State<OverviewScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeOverviewProvider>(context, listen: false);
          provider.fetchHighwayCodeOverviewData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Overview", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeOverviewProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayCodeOverviewData;
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
