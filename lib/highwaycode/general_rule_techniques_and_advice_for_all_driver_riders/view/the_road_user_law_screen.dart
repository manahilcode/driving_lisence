import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/the_road_user_law_controller.dart';

class TheRoadUserLawScreenHighway extends StatefulWidget {
  const TheRoadUserLawScreenHighway({super.key});

  @override
  State<TheRoadUserLawScreenHighway> createState() => _TheRoadUserLawScreenHighwayState();
}

class _TheRoadUserLawScreenHighwayState extends State<TheRoadUserLawScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<TheRoadUserAndTheLawProvider>(context, listen: false);
          provider.fetchTheRoadUserAndTheLaw("The road user and the law");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "The road user and the law", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<TheRoadUserAndTheLawProvider>(
          builder: (context,provider,child) {
            final data = provider.theRoadUserAndTheLaw;
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
                    createAutoSizeText(data.text2),
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
