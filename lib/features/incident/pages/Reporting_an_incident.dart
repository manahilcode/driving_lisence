import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/widget/meeting_the_standard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReportingAnIncident extends StatefulWidget {
  const ReportingAnIncident({super.key});

  @override
  State<ReportingAnIncident> createState() => _ReportingAnIncidentState();
}

class _ReportingAnIncidentState extends State<ReportingAnIncident> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Reporting an incident"),backgroundColor: Colors.green,centerTitle: true,),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network("https://via.placeholder.com/400"),
            Gap(10),
            createAutoSizeText("You MUST stop and give your name and address if you’re involved in an incident. If there’s damage to another vehicle, property or animal, report it to the owner. If you don’t do this at the time, you MUST report the incident to the police as soon as is reasonably practicable, and in any case within 24 hours (immediately in Northern Ireland)."),
            Gap(10),
            createAutoSizeText("If another person is injured and you don’t produce your insurance certificate at the time of the incident, you MUST report the incident to the police as soon as is reasonably practicable, and in any case within 24 hours (immediately in Northern Ireland)."),
            Gap(10),
            createAutoSizeText("If another vehicle is involved, find out"),
            Gap(10),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  buildBulletText("who owns the vehicle"),
                  Gap(10),
                  buildBulletText("the make and registration number of the vehicle"),
                  Gap(10),
                  buildBulletText("the other driver’s name, address and telephone number and details of their insurance."),
                  Gap(10),
                ],
              ),
            ),

            Gap(10),
            createAutoSizeText("Following an incident (or at any other time), the police may ask you for"),
            Gap(10),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  buildBulletText("your insurance certificate"),
                  buildBulletText("the MOT certificate for the vehicle you’re driving"),
                  buildBulletText("your driving licence."),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const MeetingTheStandard()),
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
                        offset: Offset(0, 3),
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
      ) ,
    );
  }
}
