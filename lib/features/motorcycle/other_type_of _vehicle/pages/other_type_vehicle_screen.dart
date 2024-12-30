import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/other_type_of%20_vehicle/pages/large_vehicle_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/other_type_vehicle_provider.dart';

class OtherTypeVehicleScreen extends StatefulWidget {
  const OtherTypeVehicleScreen({super.key});

  @override
  State<OtherTypeVehicleScreen> createState() => _OtherTypeVehicleScreenState();
}

class _OtherTypeVehicleScreenState extends State<OtherTypeVehicleScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<OtherVehicleNotifier>(context, listen: false);
      provider.loadOtherVehicleInfo("motorcycle_Other_types_of_vehicle","Other types of vehicle");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Other type of vehicle", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<OtherVehicleNotifier>(
          builder: (context,provider,child) {
            final data = provider.info;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Gap(10),
                 createHeadingText(data.title),
                  buildImage(data.image),
                  Gap(10),
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
                            builder: (context) => LargeVehicleScreen(), // Replace with your next screen
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
