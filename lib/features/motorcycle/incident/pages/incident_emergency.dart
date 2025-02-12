import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/incident_accident_emergency.dart';
import 'break_down_Screen.dart';

class IncidentEmergencyScreen extends StatefulWidget {
  const IncidentEmergencyScreen({super.key});

  @override
  State<IncidentEmergencyScreen> createState() => _IncidentEmergencyScreenState();
}

class _IncidentEmergencyScreenState extends State<IncidentEmergencyScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<IncidentNotifier>(context, listen: false);
      provider.loadIncident("Incidents_accidents_and_emergencies");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Incident Emergency",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {},
      ),
        body: Consumer<IncidentNotifier>(
            builder: (context,provider ,child) {
              final data = provider.incident;
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
                     buildImage(data.image),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the next screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BreakDownScreen(), // Replace with your next screen
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
