import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/padestrian_controller.dart';

class PadestrianScreenHighway extends StatefulWidget {
  const PadestrianScreenHighway({super.key});

  @override
  State<PadestrianScreenHighway> createState() => _PadestrianScreenHighwayState();
}

class _PadestrianScreenHighwayState extends State<PadestrianScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayPedestriansProvider>(context, listen: false);
          provider.fetchHighwayPedestriansData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Padestrian", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayPedestriansProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayPedestriansData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.header),
                    Gap(10),
                    buildImage(data.image),
                    Gap(10),
                    createAutoSizeText(data.text),
                    Gap(10),
                    Column(
                      children: data.points.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.points1.map((e) => buildBulletText(e.toString())).toList(),
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
