import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/safety_and_motorcycle/pages/seeing_is_being_seen_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/carry_passenger_load_provider.dart';

class CarryPassengerLoadScreen extends StatefulWidget {
  const CarryPassengerLoadScreen({super.key});

  @override
  State<CarryPassengerLoadScreen> createState() => _CarryPassengerLoadScreenState();
}

class _CarryPassengerLoadScreenState extends State<CarryPassengerLoadScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CarryingPassengersAndLoadsProvider>(context, listen: false);
      provider.fetchData("motorcycle_Safety_and_your_motorcycle","Carrying_passengers_and_loads");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Carry passenger load", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<CarryingPassengersAndLoadsProvider>(
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
                              builder: (context) => SeeingIsBeingSeenScreen(), // Replace with your next screen
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
