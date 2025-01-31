import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/multi_lane_carriageway_controller.dart';

class MultiLaneCarriagewayScreenHighway extends StatefulWidget {
  const MultiLaneCarriagewayScreenHighway({super.key});

  @override
  State<MultiLaneCarriagewayScreenHighway> createState() => _MultiLaneCarriagewayScreenHighwayState();
}

class _MultiLaneCarriagewayScreenHighwayState extends State<MultiLaneCarriagewayScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<MultiLaneCarriagewaysProvider>(context, listen: false);
          provider.fetchData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Multi Lane Carriageways", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<MultiLaneCarriagewaysProvider>(
          builder: (context,provider,child) {
            final data = provider.multiLaneCarriagewaysData;
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
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
