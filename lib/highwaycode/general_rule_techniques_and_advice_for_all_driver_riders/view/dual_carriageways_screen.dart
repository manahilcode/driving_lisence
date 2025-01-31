import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/dual_carriageways_controller.dart';

class DualCarriagewaysScreenHighway extends StatefulWidget {
  const DualCarriagewaysScreenHighway({super.key});

  @override
  State<DualCarriagewaysScreenHighway> createState() => _DualCarriagewaysScreenHighwayState();
}

class _DualCarriagewaysScreenHighwayState extends State<DualCarriagewaysScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<DualCarriagewaysProvider>(context, listen: false);
          provider.fetchDualCarriagewaysData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "dual carriageways", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<DualCarriagewaysProvider>(
          builder: (context,provider,child) {
            final data = provider.dualCarriagewaysData;
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
                    Column(
                      children: data.text3
                          .map((e) => buildBulletText(e.toString()))
                          .toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text4.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text5
                          .map((e) => buildBulletText(e.toString()))
                          .toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text6
                          .map((e) => buildBulletText(e.toString()))
                          .toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text7
                          .map((e) => buildBulletText(e.toString()))
                          .toList(),
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
