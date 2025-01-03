import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../../incident/pages/think_about.dart';

class MeetingWithStandard extends StatefulWidget {
  const MeetingWithStandard({super.key});

  @override
  State<MeetingWithStandard> createState() => _MeetingWithStandardState();
}

class _MeetingWithStandardState extends State<MeetingWithStandard> {
  IntroductionController? _controller;
  @override
  void didChangeDependencies() async{
    _controller = Provider.of<IntroductionController>(context, listen: false);
    await _controller?.getMeetingWithStandard();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meeting With Standard",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<IntroductionController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.meetingStandard;
          if(data == null)
          {
            return const LoadingScreen();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data?.title ?? ""),
                createAutoSizeText(data?.points1[0] ?? ""),
                Padding(
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
                        buildBulletText(data?.points1[3]?? ""),
                      ],
                    ),
                  ),
                ),
                createAutoSizeText(data?.points2[0] ?? ""),
                Padding(
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
                        buildBulletText(data?.points2[2]??""),
                        buildBulletText(data?.points2[3]??""),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(
                        builder: (context) => const ThinkAbout());

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
          );
        },
      ),
    );
  }
}
