import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/tramways_controller.dart';

class TramwaysScreenHighway extends StatefulWidget {
  const TramwaysScreenHighway({super.key});

  @override
  State<TramwaysScreenHighway> createState() => _TramwaysScreenHighwayState();
}

class _TramwaysScreenHighwayState extends State<TramwaysScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwaycodeTramwaysProvider>(context, listen: false);
          provider.fetchHighwaycodeTramwaysData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Tramways", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwaycodeTramwaysProvider>(
          builder: (context,provider,child) {
            final data = provider.tramwaysData;
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
                    createAutoSizeText(data.text3),
                    Gap(10),
                    createAutoSizeText(data.text4),
                    Gap(10),
                    createAutoSizeText(data.text5),
                    Gap(10),
                    createAutoSizeText(data.text6),
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
