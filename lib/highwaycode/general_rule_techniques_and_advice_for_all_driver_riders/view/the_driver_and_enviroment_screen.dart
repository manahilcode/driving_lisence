import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/the_driver_and_enviroment_controller.dart';

class TheDriverAndEnviromentScreenHighway extends StatefulWidget {
  const TheDriverAndEnviromentScreenHighway({super.key});

  @override
  State<TheDriverAndEnviromentScreenHighway> createState() => _TheDriverAndEnviromentScreenHighwayState();
}

class _TheDriverAndEnviromentScreenHighwayState extends State<TheDriverAndEnviromentScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<TheDriverAndEnvironmentProvider>(context, listen: false);
          provider.fetchTheDriverAndEnvironment("The Driver and the Environment");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "The Driver and the Environment", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<TheDriverAndEnvironmentProvider>(
          builder: (context,provider,child) {
            final data = provider.theDriverAndEnvironment;
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

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
