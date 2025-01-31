import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../highwaycode_categories.dart';
import '../viewmodel/additional_rules_for_motorways_controller.dart';

class AdditionalRulesForMotorwaysScreenHighway extends StatefulWidget {
  const AdditionalRulesForMotorwaysScreenHighway({super.key});

  @override
  State<AdditionalRulesForMotorwaysScreenHighway> createState() => _AdditionalRulesForMotorwaysScreenHighwayState();
}

class _AdditionalRulesForMotorwaysScreenHighwayState extends State<AdditionalRulesForMotorwaysScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<MotorwayGuideProvider>(context, listen: false);
          provider.loadMotorwayGuide("Additional rules for motorways");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Additional rules for motorways", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<MotorwayGuideProvider>(
          builder: (context,provider,child) {
            final data = provider.motorwayGuide;
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
                    buildImage(data.image),
                    Gap(10),
                    Column(
                      children :data.points.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    buildImage(data.image1),
                    Gap(10),
                    Column(
                      children: data.points1.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          //   Navigate to the next tip or page
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HighwaycodeCategories(),
                            ),
                                (Route<dynamic> route) =>
                            false, // Removes all previous routes
                          );
                        },
                        child: Center(
                          child: Container(
                            width: 300,
                            padding: const EdgeInsets.symmetric(
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
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Center(
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
