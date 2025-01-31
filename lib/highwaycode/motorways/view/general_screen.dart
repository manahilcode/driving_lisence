import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/general_controller.dart';

class GeneralScreenHighway extends StatefulWidget {
  const GeneralScreenHighway({super.key});

  @override
  State<GeneralScreenHighway> createState() => _GeneralScreenHighwayState();
}

class _GeneralScreenHighwayState extends State<GeneralScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayGeneralProvider>(context, listen: false);
          provider.loadHighwayGeneralData("highwaycode_Motorways","General");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "General", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayGeneralProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayGeneralData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: data.text.map((e) => buildBulletText(e.toString())).toList(),
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
