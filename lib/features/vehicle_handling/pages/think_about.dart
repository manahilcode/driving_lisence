import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/pages/things_discuss_paractice_instructor.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThinkAbout extends StatefulWidget {
  const ThinkAbout({super.key});

  @override
  State<ThinkAbout> createState() => _ThinkAboutState();
}

class _ThinkAboutState extends State<ThinkAbout> {
  IntroductionController? _controller;
  @override
  void didChangeDependencies() async{
    _controller = Provider.of<IntroductionController>(context, listen: false);
    await _controller!.getThinkAbout();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Think About"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<IntroductionController>(
        builder: (BuildContext context, value, Widget? child) {
          final data  = value.thinkAbout;
          return value.thinkAbout == null ?const Center(
            child: CircularProgressIndicator(),
          ): Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data?.title ?? ""),
                Container(
                  child: Column(
                    children: [
                      buildBulletText(data!.points[0]),
                      buildBulletText(data.points[1]),
                      buildBulletText(data.points[2]),
                      buildBulletText(data.points[3]),
                      buildBulletText(data.points[4]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(
                        builder: (context) => const ThingsDiscussParacticeInstructor());

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
