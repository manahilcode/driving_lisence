import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/turning_right_controller.dart';

class TurningRightScreenHighway extends StatefulWidget {
  const TurningRightScreenHighway({super.key});

  @override
  State<TurningRightScreenHighway> createState() => _TurningRightScreenHighwayState();
}

class _TurningRightScreenHighwayState extends State<TurningRightScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayTurningRightProvider>(context, listen: false);
          provider.fetchHighwayTurningRight("Turning right");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Turning right", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayTurningRightProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayTurningRight;
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
                    Column(
                      children: data.points.map((e)=> buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    buildImage(data.image),
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
