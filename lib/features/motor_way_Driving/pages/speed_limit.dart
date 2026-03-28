import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motor_way_Driving/pages/reducing_congestion.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SpeedLimit extends StatefulWidget {
  const SpeedLimit({super.key});

  @override
  State<SpeedLimit> createState() => _SpeedLimitState();
}

class _SpeedLimitState extends State<SpeedLimit> {
  Controller? _controller;

  @override
  void didChangeDependencies() {
    _controller = Provider.of<Controller>(context, listen: false);
    _controller?.fetchSpeedLimitData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speed Limit"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<Controller>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.speedLimit;
          final ans = data?.answers;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText("Speed Limit"),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data?.question ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  buildImage(data?.image1 ?? ""),
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
                  const Gap(10),
                  const Text(
                    "Answer",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  createAutoSizeText(data?.correct ?? ""),
                  createAutoSizeText(data?.points1[0] ?? ""),
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
                          buildBulletText(data?.points1[1] ?? ""),
                          buildBulletText(data?.points1[2] ?? ""),
                          buildBulletText(data?.points1[3] ?? ""),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTipWidget(data?.tip ?? ""),
                  ),
                  createAutoSizeText(data?.points2[0] ?? ""),
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
                          buildBulletText(data?.points2[1] ?? ""),
                          buildBulletText(data?.points2[2] ?? ""),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const ReducingCongestion());

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
