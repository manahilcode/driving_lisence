import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/reporting_an_incident.dart';
import 'meeting_standard_Screen.dart';

class ReportingAnIncidentScreen extends StatefulWidget {
  const ReportingAnIncidentScreen({super.key});

  @override
  State<ReportingAnIncidentScreen> createState() => _ReportingAnIncidentScreenState();
}

class _ReportingAnIncidentScreenState extends State<ReportingAnIncidentScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<IncidentReportNotifier>(context, listen: false);
      provider.loadIncidentReport("Reporting_an_incident");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Reporting an Incident",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {},
      ),
        body: Consumer<IncidentReportNotifier>(
            builder: (context,provider ,child) {
              final data = provider.incidentReport;
              if (data == null) {
                return const Center(
                  child: LoadingScreen(),
                );
              }
              return Column(
                children: [
                  createHeadingText(data.title),
                  createAutoSizeText(data.subtitle),
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
                            builder: (context) => MeetingStandardScreenIncident(), // Replace with your next screen
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
              );
            }
        ),


    );
  }
}
