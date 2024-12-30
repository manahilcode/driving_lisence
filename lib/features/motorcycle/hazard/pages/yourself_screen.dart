import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/hazard/pages/road_weather_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/loader.dart';
import '../../../motorcycle_hazard_perception_screen.dart';
import '../viewmodel/your_provider.dart';
import 'hazard_seeing_screen/seeing_hazard_screen.dart';

class YourselfScreen extends StatefulWidget {
  const YourselfScreen({super.key});

  @override
  State<YourselfScreen> createState() => _YourselfScreenState();
}

class _YourselfScreenState extends State<YourselfScreen> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;

  @override
  void initState() {
    Future.microtask(() {
      final controller =
          Provider.of<MotorcycleYourProvider>(context, listen: false);
      controller.fetchModel("motorcycle_hazard", "youself");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Your-Self",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {
            Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

            Navigator.pushAndRemoveUntil(
              context,
              newRoute,
                  (Route<dynamic> route) => false, // Removes all previous routes
            );
          }),
      body:
          Consumer<MotorcycleYourProvider>(builder: (context, provider, child) {
        final data = provider.motorcycleAnswers;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        final ans = data.answer;
        final correctAnswer = data.correct;
        final ans2 = data.answer2;
        final correctAnswer2 = data.correct2;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(provider.motorcycleAnswers?.title ??""),
                createAutoSizeText(provider.motorcycleAnswers?.subtitle ??""),
                Gap(10),
                createHeadingText(provider.motorcycleAnswers?.title1 ?? ""),
                createAutoSizeText(provider.motorcycleAnswers?.subtitle1 ??""),
                Gap(10),
                createHeadingText(provider.motorcycleAnswers?.title2 ?? ""),
                Gap(02),
                Column(
                  children: provider.motorcycleAnswers?.subtitle2
                      .map(
                        (stringItem) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            stringItem, // Display the string in a Text widget
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      )
                      .toList() ?? [], // Convert the iterable to a List<Widget>
                ),
                Gap(10),
                createHeadingText(provider.motorcycleAnswers?.title3 ?? ""),
                Column(
                  children: provider.motorcycleAnswers?.subtitle3
                      .map(
                        (stringItem) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            stringItem, // Display the string in a Text widget
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      )
                      .toList() ?? [], // Convert the iterable to a List<Widget>
                ),
                Gap(10),
                buildTipWidget(provider.motorcycleAnswers?.tip[0] ?? ""),
                Gap(10),
                createAutoSizeText("Question :"),
                createAutoSizeText(provider.motorcycleAnswers?.question ??""),
                Gap(10),
                createAutoSizeText("Options :"),
                Column(
                  children: ans.asMap().entries.map((entry) {
                    int answerIndex = entry.key; // Index of the current answer
                    String answerText = entry.value; // The actual answer text

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: ListTile(
                          tileColor: selectedAnswerIndex != null
                              ? answerText == correctAnswer
                                  ? Colors.green.withOpacity(0.7)
                                  : selectedAnswerIndex == answerIndex
                                      ? Colors.red.withOpacity(0.7)
                                      : null
                              : null,
                          leading: AutoSizeText((answerIndex + 1)
                              .toString()), // Display index + 1
                          title: AutoSizeText(
                              answerText), // Display the answer text
                          trailing: selectedAnswerIndex != null
                              ? answerText == correctAnswer
                                  ? Icon(Icons.check,
                                      color: Colors.green) // Correct answer
                                  : selectedAnswerIndex == answerIndex
                                      ? Icon(Icons.close,
                                          color: Colors.red) // Wrong answer
                                      : null
                              : null,
                          onTap: selectedAnswerIndex == null
                              ? () {
                                  setState(() {
                                    selectedAnswerIndex = answerIndex;
                                    isCorrect = answerText == correctAnswer;
                                    isSelect = true;
                                  });
                                }
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Gap(10),
                createAutoSizeText("Info"),
                createAutoSizeText(data.info),
                Gap(10),
                createHeadingText(provider.motorcycleAnswers?.title4 ??""),
                createAutoSizeText(provider.motorcycleAnswers?.subtitle4 ??""),
                Gap(10),
                createAutoSizeText("Question :"),
                createAutoSizeText(provider.motorcycleAnswers?.question2 ??""),
                Gap(10),
                createAutoSizeText("Options :"),
                Column(
                  children: ans2.asMap().entries.map((entry) {
                    int answerIndex = entry.key; // Index of the current answer
                    String answerText = entry.value; // The actual answer text

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: ListTile(
                          tileColor: selectedAnswerIndex != null
                              ? answerText == correctAnswer
                                  ? Colors.green.withOpacity(0.7)
                                  : selectedAnswerIndex == answerIndex
                                      ? Colors.red.withOpacity(0.7)
                                      : null
                              : null,
                          leading: AutoSizeText((answerIndex + 1)
                              .toString()), // Display index + 1
                          title: AutoSizeText(
                              answerText), // Display the answer text
                          trailing: selectedAnswerIndex != null
                              ? answerText == correctAnswer
                                  ? Icon(Icons.check,
                                      color: Colors.green) // Correct answer
                                  : selectedAnswerIndex == answerIndex
                                      ? Icon(Icons.close,
                                          color: Colors.red) // Wrong answer
                                      : null
                              : null,
                          onTap: selectedAnswerIndex == null
                              ? () {
                                  setState(() {
                                    selectedAnswerIndex = answerIndex;
                                    isCorrect = answerText == correctAnswer2;
                                    isSelect = true;
                                  });
                                }
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Gap(10),
                createAutoSizeText("Info"),
                Gap(10),
                createAutoSizeText(data.info1),
                Gap(10),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: provider.motorcycleAnswers?.points
                          .map((point) => buildBulletText(point))
                          .toList() ??[], // Convert to List<Widget>
                    ),
                  ),
                ),
                Gap(10),
                createHeadingText(provider.motorcycleAnswers?.title5 ?? ""),
                createAutoSizeText(provider.motorcycleAnswers?.subtitle5 ??""),
                Gap(10),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(
                        builder: (context) => const MotorcycleHazardPerceptionScreen());

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
      }),
    );
  }
}
