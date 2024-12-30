import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/motorcycle_info_provider.dart';
import 'meeting_standard_Screen.dart';

class MotorcycleInfoScreen extends StatefulWidget {
  const MotorcycleInfoScreen({super.key});

  @override
  State<MotorcycleInfoScreen> createState() => _MotorcycleInfoScreenState();
}

class _MotorcycleInfoScreenState extends State<MotorcycleInfoScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MotorcycleInfoNotifier>(context, listen: false);
      provider.loadMotorcycleInfo("motorcycle_Other_types_of_vehicle","Other_motorcycles");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Motorcycle Info", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<MotorcycleInfoNotifier>(
          builder: (context,provider,child) {
            final data = provider.info;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createHeadingText(data.title),
                    createAutoSizeText(data.subtitle),
                    buildImage(data.image),
                    createAutoSizeText(data.subtitle1),
                    Column(
                      children: data.tips.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                       //   Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeetingStandardScreenOtherType(), // Replace with your next screen
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
                ),
              ),
            );
          }
      ),
    );
  }
}
