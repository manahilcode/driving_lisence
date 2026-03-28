import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/rule_of_road/pages/lane_junction2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';

class LaneJunctions extends StatefulWidget {
  const LaneJunctions({super.key});

  @override
  State<LaneJunctions> createState() => _LaneJunctionsState();
}

class _LaneJunctionsState extends State<LaneJunctions> {
  RuleRoadController? _ruleRoadController;
  @override
  void didChangeDependencies() {
    _ruleRoadController =
        Provider.of<RuleRoadController>(context, listen: false);
    _ruleRoadController?.fetchLanesAndJunctions();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lane Junction",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<RuleRoadController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.lanesAndJunctionsValue;
          if (data == null) {
            return Center(
                child: LoadingScreen()); // or any placeholder
          }
          final ans = data.answers;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title!),
                  createAutoSizeText(data.subtitle!),
                  createAutoSizeText(data.subtitle2!),
                  createAutoSizeText(data.subtitle3!),
                  createAutoSizeText(data.subtitle4!),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      " Q : ${data.question!}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Gap(10),
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
                          builder: (context) => const LaneJunction2());

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
