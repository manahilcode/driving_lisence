import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/vulnurable_road_user/pages/vulnerable_road_user_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/vulnerable_user.dart';
import '../viewmodel/vulnurable_road_user_provider.dart';

class VulnerableUserScreen extends StatefulWidget {
  const VulnerableUserScreen({super.key});

  @override
  State<VulnerableUserScreen> createState() => _VulnerableUserScreenState();
}

class _VulnerableUserScreenState extends State<VulnerableUserScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<VulnerableRoadUsersProvider1>(context, listen: false);
      provider.fetchVulnerableRoadUsersData("Vulnerable road users");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Vulnerable User ",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<VulnerableRoadUsersProvider1>(
          builder: (context, provider, child) {
        final data = provider.data;
        if (data == null) {
          return LoadingScreen();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              createHeadingText(data.title),
             /// createAutoSizeText(data.subtitle),
              createAutoSizeText(data.subtitle),
              Column(
                children: data.points
                    .map((e) => buildBulletText(e.toString()))
                    .toList(),
              ),
              Gap(20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VulnerableRoadUserScreen(), // Replace with your next screen
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
      }),
    );
  }
}
