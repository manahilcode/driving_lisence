
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../rule_for_motorcyclist/viewmodel/general_guidance_controller.dart';
import '../../rule_for_pedestrain/viewmodel/general_guidance_controller.dart';
import '../viewmodel/wording_of_highway_code_controller.dart';

class WordingOfHighwayCodeScreenHighway extends StatefulWidget {
  const WordingOfHighwayCodeScreenHighway({super.key});

  @override
  State<WordingOfHighwayCodeScreenHighway> createState() => _WordingOfHighwayCodeScreenHighwayState();
}

class _WordingOfHighwayCodeScreenHighwayState extends State<WordingOfHighwayCodeScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeProvider123>(context, listen: false);
          provider.loadHighwayCodeData("highwaycode_introduction", "Wording of The Highway Code");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Wording of Highway Code", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeProvider123>(
          builder: (context,provider,child) {
            final data = provider.highwayCodeData;
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
