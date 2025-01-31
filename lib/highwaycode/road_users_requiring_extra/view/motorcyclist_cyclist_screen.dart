import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/motorcyclist_cyclist_controller.dart';

class MotorcyclistCyclistScreenHighway extends StatefulWidget {
  const MotorcyclistCyclistScreenHighway({super.key});

  @override
  State<MotorcyclistCyclistScreenHighway> createState() => _MotorcyclistCyclistScreenHighwayState();
}

class _MotorcyclistCyclistScreenHighwayState extends State<MotorcyclistCyclistScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<MotorcyclistsAndCyclistsProvider>(context, listen: false);
          provider.fetchMotorcyclistsAndCyclistsData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Motorcyclists and Cyclists", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<MotorcyclistsAndCyclistsProvider>(
          builder: (context,provider,child) {
            final data = provider.motorcyclistsAndCyclistsData;
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
                    buildImage(data.image),
                    Gap(10),
                    createAutoSizeText(data.text1),
                    Gap(10),
                    createAutoSizeText(data.text2),
                    Gap(10),
                    createAutoSizeText(data.text3),
                    Gap(10),
                    createAutoSizeText(data.text4),
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
