import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/think_about.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MeetingTheStandard extends StatefulWidget {
  const MeetingTheStandard({super.key});

  @override
  State<MeetingTheStandard> createState() => _MeetingTheStandardState();
}

class _MeetingTheStandardState extends State<MeetingTheStandard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Meeting the standards"),centerTitle: true,backgroundColor: Colors.green,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            createHeadingText("Meeting the standards"),
            Gap(10),
            createAutoSizeText("At the scene of an incident you must be able to"),
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
                  buildBulletText("stop and park your vehicle in a safe place, if necessary"),
                  buildBulletText("make sure that warning is given to other road users"),
                  buildBulletText("give help to others if you can"),
                  buildBulletText("where possible, record information about what you saw or the scene that you found. It may be helpful to take photographs and draw sketch plans."),
                ],
              ),
            ),

            Gap(10),
            createAutoSizeText("You must know and understand"),
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
                  buildBulletText("how to keep control of the vehicle, where possible, if it breaks down"),
                  buildBulletText("how and when to use a warning triangle or hazard warning lights"),
                  buildBulletText("what the law says about stopping if you’re involved in an incident that causes damage or injury to"),
                  buildBulletText("any other person"),
                  buildBulletText("another vehicle"),
                  buildBulletText("an animal"),
                  buildBulletText("someone’s property"),

                ],
              ),
            ),

            createAutoSizeText("This includes what to do about"),

            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  buildBulletText("stopping"),
                  buildBulletText("providing your details"),
                  buildBulletText("giving statements"),
                  buildBulletText("producing documents"),
                  buildBulletText(
                    "how to contact the emergency services and how important it is to give them accurate information."
                  )
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
                      const ThinkAbout()),
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
      ),
    );
  }
}
