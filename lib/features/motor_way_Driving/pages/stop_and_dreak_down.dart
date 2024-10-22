import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motor_way_Driving/pages/meeting_standard.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StopAndDreakDown extends StatefulWidget {
  const StopAndDreakDown({super.key});

  @override
  State<StopAndDreakDown> createState() => _StopAndDreakDownState();
}

class _StopAndDreakDownState extends State<StopAndDreakDown> {
  Controller? _controller;
  @override
  void didChangeDependencies() {
    _controller = Provider.of<Controller>(context, listen: false);
    _controller?.fetchStoppingAndBreakdownsData();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Stop And Break Down"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<Controller>(
        builder: (context,value,child) {
          final data  = value.stoppingAndBreakdowns;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  createHeadingText(data?.title ?? ""),
                  buildImage(data?.image1 ?? ""),
                  createAutoSizeText(data?.subtitle ?? ""),
                  createAutoSizeText(data?.points[0] ?? "?"),
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
                        buildBulletText(data?.points[1]??""),
                        buildBulletText(data?.points[2]??""),
                        buildBulletText(data?.points[3]??""),
              
                      ],
                    ),
                  ),
                  ),
                  createAutoSizeText(data?.points[5]??""),
                  createAutoSizeText(data?.points[6]??""),
                  buildImage(data?.image2 ?? ""),
                  createAutoSizeText(data?.points2[0]??""),
                  createAutoSizeText(data?.points2[1]??""),
                  createAutoSizeText(data?.points2[2]??""),
                  createAutoSizeText(data?.subtitle2??""),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data?.points3[0] ?? ""),
                        buildBulletText(data?.points3[1] ?? ""),
                        buildBulletText(data?.points3[2] ?? ""),
                      ],
                    ),
                  ),
              
                  createAutoSizeText(data?.points4[0]??""),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data?.points4[1] ?? ""),
                        buildBulletText(data?.points4[2] ?? ""),
                        buildBulletText(data?.points4[3] ?? ""),
                        buildBulletText(data?.points4[5] ?? ""),
                      ],
                    ),
                  ),
              
                  createAutoSizeText(data?.subtitle3 ?? ""),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data?.points5[0] ?? ""),
                        buildBulletText(data?.points5[1] ?? ""),
                        buildBulletText(data?.points5[2] ?? ""),
              
                      ],
                    ),
                  ),
              
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const MeetingStandard());
              
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
        }
      ),
    );
  }
}
