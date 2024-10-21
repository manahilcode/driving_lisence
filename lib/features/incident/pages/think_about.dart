import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/think_discuss_practice_instructor.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ThinkAbout extends StatefulWidget {
  const ThinkAbout({super.key});

  @override
  State<ThinkAbout> createState() => _ThinkAboutState();
}

class _ThinkAboutState extends State<ThinkAbout> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Think about"),
        backgroundColor: Colors.green,
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          createHeadingText("Think about"),
            const Gap(10),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  buildBulletText("What should you do if your car breaks down on the motorway?"),
                  buildBulletText("How can you warn other road users if you’ve broken down on the road?"),
                  buildBulletText("If you’re the first person to arrive at the scene of a crash, what should you do?"),
                  buildBulletText("If a motorcyclist is involved in the crash, should you remove their helmet?"),
                  buildBulletText("If you’re involved in an incident with another vehicle, what must you do?"),
                  buildBulletText("What does DR ABC stand for?"),

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
                      const ThinkDiscussPracticeInstructor()),
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
