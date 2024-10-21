import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/helping_other_giving_first_aid.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StopAtInAccident extends StatefulWidget {
  const StopAtInAccident({super.key});

  @override
  State<StopAtInAccident> createState() => _StopAtInAccidentState();
}

class _StopAtInAccidentState extends State<StopAtInAccident> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Stopping at an incident"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Gap(10),
          createAutoSizeText("If you’re the first to arrive at the scene of an incident or crash, stop and warn other traffic. Switch on your hazard warning lights. Don’t put yourself at risk."),
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
                buildBulletText("Make sure that the emergency services are called as soon as possible."),
                buildBulletText("Ensure that the engines of any vehicles at the scene are switched off."),
                buildBulletText("Move uninjured people away from the scene."),
              ],
            ),
          ),
          buildImage("https://via.placeholder.com/400"),
          Gap(10),
          createAutoSizeText("A vehicle carrying dangerous goods will display an orange label or a hazard warning plate on the back. If a vehicle carrying something hazardous is involved in an incident, report what the label says when you call the emergency services. The different plates are shown in The Official Highway Code."),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const HelpingOtherGivingFirstAid()),
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
    );
  }

}
