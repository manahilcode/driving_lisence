import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/first_aid_on_road_controller.dart';

class FirstAidOnRoadScreenHighway extends StatefulWidget {
  const FirstAidOnRoadScreenHighway({super.key});

  @override
  State<FirstAidOnRoadScreenHighway> createState() => _FirstAidOnRoadScreenHighwayState();
}

class _FirstAidOnRoadScreenHighwayState extends State<FirstAidOnRoadScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayFirstAidOnTheRoadProvider>(context, listen: false);
          provider.fetchFirstAidOnTheRoadDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "First Aid on the Road", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayFirstAidOnTheRoadProvider>(
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
