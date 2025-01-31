import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/other_vehicle_controller.dart';

class OtherVehicleScreenHighway extends StatefulWidget {
  const OtherVehicleScreenHighway({super.key});

  @override
  State<OtherVehicleScreenHighway> createState() => _OtherVehicleScreenHighwayState();
}

class _OtherVehicleScreenHighwayState extends State<OtherVehicleScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayOtherVehiclesProvider>(context, listen: false);
          provider.fetchHighwayOtherVehiclesData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Other Vehicle", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayOtherVehiclesProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayOtherVehiclesData;
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
                    createAutoSizeText(data.text5),
                    Gap(10),
                    createAutoSizeText(data.text6),
                    Gap(10),
                    Column(
                      children: data.text7.map((e)=> buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text8.map((e)=> buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text9.map((e)=> buildBulletText(e.toString())).toList(),
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
