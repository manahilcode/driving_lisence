import 'package:driving_lisence/category.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ThinkDiscussPracticeInstructor extends StatefulWidget {
  const ThinkDiscussPracticeInstructor({super.key});

  @override
  State<ThinkDiscussPracticeInstructor> createState() =>
      _ThinkDiscussPracticeInstructorState();
}

class _ThinkDiscussPracticeInstructorState
    extends State<ThinkDiscussPracticeInstructor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Things to discuss and practise with your instructor"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              createHeadingText(
                  "Things to discuss and practise with your instructor"),
              Gap(10),
              createAutoSizeText(
                  "These are just a few examples of what you could discuss with your instructor. Read more about incidents, accidents and emergencies to come up with your own ideas."),
              Gap(20),
              createAutoSizeText("Discuss with your instructor"),
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
                    buildBulletText(
                        "what it means if you see a driver displaying a ‘help’ pennant"),
                    buildBulletText(
                        "when you may and may not use your hazard warning lights"),
                    buildBulletText(
                        "what you should do if you arrive at the scene of a crash and find"),
                    buildBulletText(
                        "someone bleeding badly with nothing embedded in their wound"),
                    buildBulletText("someone with a burn"),
                    buildBulletText("someone who isn’t breathing normally"),
                    buildBulletText("an injured motorcyclist wearing a helmet."),
                  ],
                ),
              ),
              Gap(20),
              createHeadingText("Practise with your instructor"),
              Gap(10),
              createAutoSizeText(
                  "Hopefully, you won’t have the opportunity to practise what to do in the event of an incident or emergency during your driving lesson. Instead, practise with your instructor"),
              Gap(10),
              Container(
                child: Column(
                  children: [
                    buildBulletText("learning the rules relating to"),
                    buildBulletText(
                        "breakdowns on all roads, including motorwayso"),
                    buildBulletText("obstructions"),
                    buildBulletText(
                        "incidents, eg warning signs and flashing lights"),
                    buildBulletText("passing and being involved in a crash"),
                    buildBulletText("incidents involving dangerous goods"),
                    buildBulletText(
                        "which documents you’ll need to produce if you’re involved in a crash"),
                    buildBulletText("incidents in tunnels."),
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
                         Category()),
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
      ),
    );
  }
}
