import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/dealing_with_fault_provider.dart';
import 'carry_passenger_load_screen.dart';

class DealingWithFualtScreen extends StatefulWidget {
  const DealingWithFualtScreen({super.key});

  @override
  State<DealingWithFualtScreen> createState() => _DealingWithFualtScreenState();
}

class _DealingWithFualtScreenState extends State<DealingWithFualtScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<WheelBalancingProvider>(context, listen: false);
      provider.fetchWheelBalancingInfo("motorcycle_Safety_and_your_motorcycle"," Dealing_with_faults");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: CustomAppBar(title: "dealing with fault", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<WheelBalancingProvider>(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildTipWidget(data.tip),
                    ),
                    createAutoSizeText(data.wheelBalancing),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Column(
                      children: data.points1.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Column(
                      children: [
                        createAutoSizeText(data.image1[0]),
                        buildImage(data.image1[1]),
                        createAutoSizeText(data.image1[2]),
                        buildImage(data.image1[3]),
                      ],

                           ),
                    Gap(10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarryPassengerLoadScreen(), // Replace with your next screen
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
