import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/other_animal_controller.dart';

class OtherAnimalScreenHighway extends StatefulWidget {
  const OtherAnimalScreenHighway({super.key});

  @override
  State<OtherAnimalScreenHighway> createState() => _OtherAnimalScreenHighwayState();
}

class _OtherAnimalScreenHighwayState extends State<OtherAnimalScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeOtherAnimalsProvider>(context, listen: false);
          provider.fetchHighwayCodeOtherAnimalsData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Other animals", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeOtherAnimalsProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayCodeOtherAnimalsData;
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
                     children: data.text.map((e)=> buildBulletText(e.toString()) ).toList(),
                   ),
                    Gap(10),
                    Column(
                      children: data.text1.map((e)=> buildBulletText(e.toString()) ).toList(),
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
