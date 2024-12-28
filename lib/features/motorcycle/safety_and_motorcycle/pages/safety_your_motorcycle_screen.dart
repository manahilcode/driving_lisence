import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/safetly_your_motorcycle_provider.dart';
import 'looking_after_motorcycle_screen.dart';

class SafetyYourMotorcycleScreen extends StatefulWidget {
  const SafetyYourMotorcycleScreen({super.key});

  @override
  State<SafetyYourMotorcycleScreen> createState() => _SafetyYourMotorcycleScreenState();
}

class _SafetyYourMotorcycleScreenState extends State<SafetyYourMotorcycleScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SafetyYourMotorcycleNotifier>(context, listen: false);
      provider.fetchData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "safety your motorcycle", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<SafetyYourMotorcycleNotifier>(
          builder: (context,provider,child) {
            final data = provider.safetyYourMotorcycleData;
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
                  buildImage(data.image),
                  Column(
                    children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                  ),
                  Gap(10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LookingAfterMotorcycleScreen(), // Replace with your next screen
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
