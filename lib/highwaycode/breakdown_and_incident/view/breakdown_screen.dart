import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../../../highwaycode_categories.dart';
import '../viewmodel/breakdown_controller.dart';

class BreakdownScreenHighway extends StatefulWidget {
  const BreakdownScreenHighway({super.key});

  @override
  State<BreakdownScreenHighway> createState() => _BreakdownScreenHighwayState();
}

class _BreakdownScreenHighwayState extends State<BreakdownScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<BreakdownPointsProvider>(context, listen: false);
          provider.fetchGuidelines();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Breakdown", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HighwaycodeCategories(),
          ),
              (Route<dynamic> route) =>
          false, // Removes all previous routes
        );
      }),
      body: Consumer<BreakdownPointsProvider>(
          builder: (context,provider,child) {
            final data = provider.guidelines;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: data.points
                          .map((e) => buildBulletText(e.toString()))
                          .toList(),
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
