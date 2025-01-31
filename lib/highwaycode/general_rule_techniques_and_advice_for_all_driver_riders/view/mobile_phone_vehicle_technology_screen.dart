import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/mobile_phone_vehicle_technology_controller.dart';

class MobilePhoneVehicleTechnologyScreenHighway extends StatefulWidget {
  const MobilePhoneVehicleTechnologyScreenHighway({super.key});

  @override
  State<MobilePhoneVehicleTechnologyScreenHighway> createState() => _MobilePhoneVehicleTechnologyScreenHighwayState();
}

class _MobilePhoneVehicleTechnologyScreenHighwayState extends State<MobilePhoneVehicleTechnologyScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<MobilePhonesProvider>(context, listen: false);
          provider.fetchData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Mobile Phone Vehicle Technology", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<MobilePhonesProvider>(
          builder: (context,provider,child) {
            final data = provider.mobilePhonesData;
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
                    Column(
                      children: data.text4.map((e)=>buildBulletText(e.toString())).toList(),
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
