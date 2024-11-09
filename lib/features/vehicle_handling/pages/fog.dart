import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/pages/very_bad_weather.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../model/model.dart';
import '../viewmodel/controller.dart';

class FogScreen extends StatefulWidget {
  const FogScreen({super.key});

  @override
  State<FogScreen> createState() => _FogScreenState();
}

class _FogScreenState extends State<FogScreen> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  IntroductionController? _controller;
  @override
  void didChangeDependencies() async {
    _controller = Provider.of<IntroductionController>(context, listen: false);
    await _controller?.getFogData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fog",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IntroductionController>(builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: _controller?.fogModels.length,
            itemBuilder: (BuildContext context, int index) {
              final data = _controller!.fogModels[index];
              final correctAnswer = data.correctAnswer;
              if(data == null)
              {
                return const LoadingScreen();
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  createHeadingText(_controller!.fogModels[index].title),
                  createAutoSizeText(data.subtitle),
                  buildImage(data.image),
                  createAutoSizeText(data.points[0]),
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
                          buildBulletText(data.points[1]),
                          buildBulletText(data.points[2]),
                          buildBulletText(data.points[3]),
                        ],
                      ),
                    ),
                  ),
                  createAutoSizeText(data.subtitle2),
                  buildTipWidget(data.tip),
                  createAutoSizeText(data.points2[0]),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data.points2[1]),
                        buildBulletText(data.points2[2]),
                      ],
                    ),
                  ),
                  Gap(10),
                  createHeadingText(data.question),
                  Gap(10),
                  Column(
                    children: data.answers.entries.map((entry) {
                      String answerKey = entry.key; // Key is a string
                      String answerText = entry.value;
                      int answerIndex = int.tryParse(answerKey) ?? 0;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: ListTile(
                            tileColor: selectedAnswerIndex != null
                                ? answerText == correctAnswer
                                    ? Colors.green.withOpacity(0.7)
                                    : selectedAnswerIndex == answerIndex
                                        ? Colors.red.withOpacity(0.7)
                                        : null
                                : null,
                            leading: Text(
                              entry.key, // Disply the key
                              style: TextStyle(),
                            ),
                            trailing: selectedAnswerIndex != null
                                ? answerText == correctAnswer
                                    ? const Icon(Icons.check, color: Colors.green)
                                    : selectedAnswerIndex == answerIndex
                                        ? Icon(Icons.close, color: Colors.red)
                                        : null
                                : null,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  //    color: isCorrect ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black, // Border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: Text(
                                  entry.value, // Display the answer
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  createHeadingText("Correct"),
                  createAutoSizeText(data.correctAnswer),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const VeryBadWeather());

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
              );
            },
          ),
        );
      }),
    );
  }
}
