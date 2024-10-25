import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/widget/meeting_the_standard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class ReportingAnIncident extends StatefulWidget {
  const ReportingAnIncident({super.key});

  @override
  State<ReportingAnIncident> createState() => _ReportingAnIncidentState();
}

class _ReportingAnIncidentState extends State<ReportingAnIncident> {
  IncidentController? _incidentController;

  @override
  void didChangeDependencies() {
    _incidentController = Provider.of<IncidentController>(context,listen: false);
    _incidentController?.fetchReportingIncident("reporting_an_incident");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Reporting an incident",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<IncidentController>(
          builder: (context,value,child) {
            final data = value.reportingIncident;
            if(data == null)
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createHeadingText(data.title!),
                    buildImage(data.image!),
                    const Gap(10),
                    createAutoSizeText(data.subtitle!),
                    const Gap(10),
                    createAutoSizeText(data.subtitle2!),
                    const Gap(10),
                    Align(
                      alignment: Alignment.topLeft,
                        child: createAutoSizeText(data.points![0])),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Column(
                          children: [
                            buildBulletText(data.points![1]),
                            const Gap(10),
                            buildBulletText(data.points![2]),
                            const Gap(10),
                            buildBulletText(data.points![3]),
                            const Gap(10),
                          ],
                        ),
                      ),
                    ),

                    const Gap(10),
                    createAutoSizeText(data.points![4]),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Column(
                          children: [
                            buildBulletText(data.points![5]),
                            buildBulletText(data.points![6]),
                            buildBulletText(data.points![7]),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const MeetingTheStandardIncident()),
                        );
                      },
                      child: Center(
                        child: Container(
                          width: 300,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 30.0),
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
                  ],
                ),
              ),
            );
          }
        ),
      ) ,
    );
  }
}
