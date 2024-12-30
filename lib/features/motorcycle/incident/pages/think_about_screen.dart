import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/incident/pages/things_discuss_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../motorcycle_handling/viewmodel/think_About_provider.dart';
import '../viewmodel/think_about.dart';

class ThinkAboutScreenIncident extends StatefulWidget {
  const ThinkAboutScreenIncident({super.key});

  @override
  State<ThinkAboutScreenIncident> createState() => _ThinkAboutScreenIncidentState();
}

class _ThinkAboutScreenIncidentState extends State<ThinkAboutScreenIncident> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ThinkAboutNotifierIncidentMotorcycle>(context, listen: false);
      provider.loadThinkAbout("Think_about");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Alertness",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {},
      ),
        body: Consumer<ThinkAboutNotifierIncidentMotorcycle>(
            builder: (context,provider ,child) {
              final data = provider.thinkAbout;
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
                      Column(
                        children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the next screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThingsDiscussScreenIncident(), // Replace with your next screen
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
