import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/incident_accident_emergency.dart';
import '../viewmodel/stoping_an_incident.dart';
import 'helping_other_Screen.dart';

class StopingAnIncidentScreen extends StatefulWidget {
  const StopingAnIncidentScreen({super.key});

  @override
  State<StopingAnIncidentScreen> createState() => _StopingAnIncidentScreenState();
}

class _StopingAnIncidentScreenState extends State<StopingAnIncidentScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<IncidentStopNotifier>(context, listen: false);
      provider.loadIncident("Stopping_at_an_incident");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Stop an Incident",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {},
      ),
        body: Consumer<IncidentStopNotifier>(
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
                                builder: (context) => HelpingOtherScreen(), // Replace with your next screen
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
