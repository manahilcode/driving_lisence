import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/motorcycle_handling/pages/traffic_calming_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/keep_control_motorcycle.dart';

class KeepControlMotorcycleScreen extends StatefulWidget {
  const KeepControlMotorcycleScreen({super.key});

  @override
  State<KeepControlMotorcycleScreen> createState() => _KeepControlMotorcycleScreenState();
}

class _KeepControlMotorcycleScreenState extends State<KeepControlMotorcycleScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MotorcycleControlInfoNotifier>(context, listen: false);
      provider.loadControlInfo("motorcycle_Motorcycle_handling","Keeping_control_of_your_motorcycle");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Keep control motorcycle",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {},
      ),
      body: Consumer<MotorcycleControlInfoNotifier>(
          builder: (context,provider,child) {
            final data = provider.info;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Column(
              children: [
                createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                buildImage(data.image),
                createAutoSizeText(data.subtitle1),
                buildImage(data.image1),
                createAutoSizeText(data.subtitle2),
                buildImage(data.image2),
                createAutoSizeText(data.subtitle3),
                buildImage(data.image3),
                createAutoSizeText(data.subtitle4),
                Column(
                  children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                ),
                createAutoSizeText(data.subtitle5),
                Column(
                  children: data.points1.map((e)=>buildBulletText(e.toString())).toList(),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrafficCalmingScreen(), // Replace with your next screen
                        ),
                      );
                    },
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 30.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
