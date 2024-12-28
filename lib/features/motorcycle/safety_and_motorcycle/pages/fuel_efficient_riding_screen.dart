import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/fuel_efficient_riding_provider.dart';
import 'avoid_congession_screen.dart';

class FuelEfficientRidingScreen extends StatefulWidget {
  const FuelEfficientRidingScreen({super.key});

  @override
  State<FuelEfficientRidingScreen> createState() => _FuelEfficientRidingScreenState();
}

class _FuelEfficientRidingScreenState extends State<FuelEfficientRidingScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<NoisePollutionProvider>(context, listen: false);
      provider.fetchData("motorcycle_Safety_and_your_motorcycle","Fuel_efficient_riding");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Fuel efficient riding", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<NoisePollutionProvider>(
          builder: (context,provider,child) {
            final data = provider.data;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createHeadingText(data.title),
                    createAutoSizeText(data.subtitle),
                    buildImage(data.image),
                    createHeadingText(data.title1),
                    createAutoSizeText(data.subtitle2),
                    buildImage(data.image1),
                    buildTipWidget(data.tip),
                    buildImage(data.tip1),
                    createAutoSizeText(data.subtitle3),
                    Column(
                      children: [
                        buildImage(data.image),
                        createAutoSizeText(data.text)
                      ],
                    ),
                    Column(
                      children: [
                        buildImage(data.image1),
                        createAutoSizeText(data.text1)
                      ],
                    ),
                    Column(
                      children: [
                        buildImage(data.image2),
                        createAutoSizeText(data.text2)
                      ],
                    ),
                    Column(
                      children: [
                        buildImage(data.image3),
                        createAutoSizeText(data.text3)
                      ],
                    ),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Gap(20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AvoidCongessionScreen(), // Replace with your next screen
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
