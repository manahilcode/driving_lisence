import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/allertness/pages/think_about.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/meeting_standard_provider.dart';

class MeetingStandardScreenAllert extends StatefulWidget {
  const MeetingStandardScreenAllert({super.key});

  @override
  State<MeetingStandardScreenAllert> createState() => _MeetingStandardScreenAllertState();
}

class _MeetingStandardScreenAllertState extends State<MeetingStandardScreenAllert> {
  @override
  void initState() {
    // TODO: implement initState
    //Meeting_the_standards
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MeetingTheStandardsProviderMotorcycleAllert>(context, listen: false);
      provider.fetchMeetingTheStandardsData("motorcycle_alertness", "Meeting_the_standards");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Meeting_the_standards ", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),

      body: Consumer<MeetingTheStandardsProviderMotorcycleAllert>(
        builder: (context,provider,child) {
          final data = provider.data;

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
                  createAutoSizeText(data.title1),
                  Column(
                    children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                  ),
                  createAutoSizeText(data.title2),

              
                  Center(
                    child: GestureDetector(
                      onTap: () {
                      //  Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThinkAboutScreenAllert(), // Replace with your next screen
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
