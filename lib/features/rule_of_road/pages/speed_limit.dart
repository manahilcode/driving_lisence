import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/rule_of_road/pages/speed_limit2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class SpeedLimit extends StatefulWidget {
  const SpeedLimit({super.key});

  @override
  State<SpeedLimit> createState() => _SpeedLimitState();
}

class _SpeedLimitState extends State<SpeedLimit> {
  RuleRoadController? _ruleRoadController;
  @override
  void didChangeDependencies() {
    _ruleRoadController =
        Provider.of<RuleRoadController>(context, listen: false);
    _ruleRoadController?.fetchSpeedLimit();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speed Limit",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<RuleRoadController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.speedLimitValue;
          if (data == null) {
            return Center(
                child: CircularProgressIndicator()); // or any placeholder
          }
          final ans = data.answers;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title!),
                  Gap(10),
                  buildImage(data.image!),
                  createAutoSizeText(data.subtitle!),
                  createAutoSizeText(data.points![0]),
                  Container(
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
                            buildBulletText(data.points![2]),
                            buildBulletText(data.points![3]),
                            buildBulletText(data.points![4]),
                            buildBulletText(data.points![5]),
                          ],
                        ),
                    ),
                  ),

                  Container(
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
                          createHeadingText(data.defTitle1!),
                          createAutoSizeText(data.defSubtitle1!),
                        ],
                      ),
                    ),
                  ),

                  Container(
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
                          createHeadingText(data.defTitle2!),
                          createAutoSizeText(data.defSubtitle2!),
                        ],
                      ),
                    ),
                  ),






                  createAutoSizeText(data.subtitle2!),

                  AutoSizeText(
                   " Q : ${data.question!}",
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),

                  Gap(10),
                  buildImage(data.questionImage!),
                  if (ans != null)
                    Column(
                      children: ans.entries.map((entry) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(entry.key.toString()),
                            ),
                            title: Text(entry.value),
                          ),
                        );
                      }).toList(),
                    ),
                  Gap(10),
                  createHeadingText("Answer"),
                  createAutoSizeText(data.correct!),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const SpeedLimit2());

                      Navigator.pushAndRemoveUntil(
                        context,
                        newRoute,
                        (Route<dynamic> route) =>
                            false, // Removes all previous routes
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
        },
      ),
    );
  }
}
