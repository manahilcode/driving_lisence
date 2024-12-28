import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/being_aware_of_enviroment_provider.dart';
import 'fuel_efficient_riding_screen.dart';

class BeingAwareOfEnviromentScreen extends StatefulWidget {
  const BeingAwareOfEnviromentScreen({super.key});

  @override
  State<BeingAwareOfEnviromentScreen> createState() => _BeingAwareOfEnviromentScreenState();
}

class _BeingAwareOfEnviromentScreenState extends State<BeingAwareOfEnviromentScreen> {
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   final provider = Provider.of<BeingAwareOfTheEnvironmentProvider>(context, listen: false);
    //   provider.fetchData("motorcycle_Safety_and_your_motorcycle","Being_aware_of_the_environment");
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BeingAwareOfTheEnvironmentProvider>(context, listen: false);
      provider.fetchData("motorcycle_Safety_and_your_motorcycle","Being_aware_of_the_environment");
    });
    return  Scaffold(
      appBar: CustomAppBar(title: "Be aware of environment", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<BeingAwareOfTheEnvironmentProvider>(
          builder: (context,provider,child) {
            final data = provider.data;
            if(data == null)
            {
              return LoadingScreen();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title),
                  createAutoSizeText(data.subtitle),
                  createAutoSizeText(data.reduce),
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
                            builder: (context) => FuelEfficientRidingScreen(), // Replace with your next screen
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
            );
          }
      ),

    );
  }
}
