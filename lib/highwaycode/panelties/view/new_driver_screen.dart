import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/new_driver_controller.dart';

class NewDriverScreenHighway extends StatefulWidget {
  const NewDriverScreenHighway({super.key});

  @override
  State<NewDriverScreenHighway> createState() => _NewDriverScreenHighwayState();
}

class _NewDriverScreenHighwayState extends State<NewDriverScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayNewDriversProvider>(context, listen: false);
          provider.fetchHighwayNewDriversData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "New Driver", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayNewDriversProvider>(
          builder: (context,provider,child) {
            final data = provider.highwayNewDriversData;
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

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
