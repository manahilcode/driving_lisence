import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/seat_belts_and_child_restraints_controller.dart';

class SeatBeltsAndChildRestraintsScreenHighway extends StatefulWidget {
  const SeatBeltsAndChildRestraintsScreenHighway({super.key});

  @override
  State<SeatBeltsAndChildRestraintsScreenHighway> createState() => _SeatBeltsAndChildRestraintsScreenHighwayState();
}

class _SeatBeltsAndChildRestraintsScreenHighwayState extends State<SeatBeltsAndChildRestraintsScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<SeatBeltsAndChildRestraintsProvider>(context, listen: false);
          provider.fetchSeatBeltsAndChildRestraints();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Seat Belts and Child Restraints", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<SeatBeltsAndChildRestraintsProvider>(
          builder: (context,provider,child) {
            final data = provider.seatBeltsData;
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
                    createAutoSizeText(data.text),
                    Gap(10),
                    createAutoSizeText(data.text1),
                    Gap(10),
                    createAutoSizeText(data.text2),
                    Gap(10),
                    Column(
                      children: data.text3.map((e)=>buildBulletText(e.toString())).toList(),
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
