import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/before_setting_off_controller.dart';

class BeforeSettingOffScreenHighway extends StatefulWidget {
  const BeforeSettingOffScreenHighway({super.key});

  @override
  State<BeforeSettingOffScreenHighway> createState() => _BeforeSettingOffScreenHighwayState();
}

class _BeforeSettingOffScreenHighwayState extends State<BeforeSettingOffScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<BeforeSettingOffProvider>(context, listen: false);
          provider.fetchBeforeSettingOffData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Before Setting Off", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<BeforeSettingOffProvider>(
          builder: (context,provider,child) {
            final data = provider.beforeSettingOffData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildImage(data.image),
                    Gap(10),
                    Column(
                      children: data.text.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
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
