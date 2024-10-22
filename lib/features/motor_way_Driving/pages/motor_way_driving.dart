import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../viewmodel/controller.dart';
import 'Driving_on_motor_way.dart';

class MotorWayDriving extends StatefulWidget {
  const MotorWayDriving({super.key});

  @override
  State<MotorWayDriving> createState() => _MotorWayDrivingState();
}

class _MotorWayDrivingState extends State<MotorWayDriving> {
  Controller? _controller;

  @override
  void didChangeDependencies() {
    _controller = Provider.of<Controller>(context, listen: false);
    _controller?.fetchMotorwayDrivingData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Motorway Driving",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<Controller>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.motorwayDriving;
          final ans = data?.answers;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data?.title ?? "",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data?.subtitle ?? "",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data?.question ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Constrain ListView within the column using Expanded or Flexible
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
                   const Text("Answer"),
                  createAutoSizeText(
                    data?.correctAnswer??"",
                  ),
                  buildTipWidget(data?.tip ?? ""),
                  createAutoSizeText(data?.points[0]?? ""),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                      buildBulletText(data?.points[1] ?? ""),
                        buildBulletText(data?.points[2] ?? ""),
                        buildBulletText(data?.points[3] ?? ""),
                        buildBulletText(data?.points[4] ?? ""),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const DrivingOnMotorWay());

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
