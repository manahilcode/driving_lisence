import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/alcohal_drugs_controller.dart';

class AlcohalDrugsScreenHighway extends StatefulWidget {
  const AlcohalDrugsScreenHighway({super.key});

  @override
  State<AlcohalDrugsScreenHighway> createState() => _AlcohalDrugsScreenHighwayState();
}

class _AlcohalDrugsScreenHighwayState extends State<AlcohalDrugsScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeAlcoholDrugsProvider>(context, listen: false);
          provider.fetchHighwayCodeAlcoholDrugsData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Alcohol and Drugs", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeAlcoholDrugsProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayCodeAlcoholDrugsData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.text1),
                    Gap(10),
                    Column(
                      children: data.text.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),

                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
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
