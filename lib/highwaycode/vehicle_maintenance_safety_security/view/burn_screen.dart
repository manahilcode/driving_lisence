import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/burn_controller.dart';

class BurnScreenHighway extends StatefulWidget {
  const BurnScreenHighway({super.key});

  @override
  State<BurnScreenHighway> createState() => _BurnScreenHighwayState();
}

class _BurnScreenHighwayState extends State<BurnScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayBurnsProvider>(context, listen: false);
          provider.fetchBurnsDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Burns", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayBurnsProvider>(
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
