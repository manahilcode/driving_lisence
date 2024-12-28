import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/looking_after_motorcycle_provider.dart';
import 'dealing_with_fualt_screen.dart';

class LookingAfterMotorcycleScreen extends StatefulWidget {
  const LookingAfterMotorcycleScreen({super.key});

  @override
  State<LookingAfterMotorcycleScreen> createState() => _LookingAfterMotorcycleScreenState();
}

class _LookingAfterMotorcycleScreenState extends State<LookingAfterMotorcycleScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MotorcycleMaintenanceNotifier>(context, listen: false);
      provider.fetchData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Looking after motorcycle", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<MotorcycleMaintenanceNotifier>(
          builder: (context,provider,child) {
            final data = provider.maintenanceData;
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
                    createAutoSizeText(data.fuel),
                    Column(
                      children: [
                        buildImage(data.tip[0].image),
                        createAutoSizeText(data.tip[0].subtitle),
                        createHeadingText(data.tip[0].title),
                      ]
                    ),
                    Gap(10),
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
                              builder: (context) => DealingWithFualtScreen(), // Replace with your next screen
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
