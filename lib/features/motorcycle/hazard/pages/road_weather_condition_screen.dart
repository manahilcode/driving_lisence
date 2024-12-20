import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/imagewithtext.dart';
import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/hazard/pages/yourself_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../motorcycle_hazard_perception_screen.dart';
import '../viewmodel/road_weather_condition_provider.dart';

class RoadWeatherConditionScreen extends StatefulWidget {
  const RoadWeatherConditionScreen({super.key});

  @override
  State<RoadWeatherConditionScreen> createState() =>
      _RoadWeatherConditionScreenState();
}

class _RoadWeatherConditionScreenState
    extends State<RoadWeatherConditionScreen> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  @override
  @override
  void initState() {
    Future.microtask(() {
      final controller = Provider.of<MotorcycleRoadWeatherConditionsProvider>(
          context,
          listen: false);
      controller.fetchRoadWeatherConditions(
          "motorcycle_hazard", "Road_and_weather_conditions");
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Road and Weather Condition",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {
            Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

            Navigator.pushAndRemoveUntil(
              context,
              newRoute,
                  (Route<dynamic> route) => false, // Removes all previous routes
            );
          }),
      body: Consumer<MotorcycleRoadWeatherConditionsProvider>(
          builder: (context, provider, child) {
        final data = provider.roadWeatherConditions;

        if (data == null) {
          return LoadingScreen();
        }

        final ans = data?.answer;
        final correctAnswer = data?.correct;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(provider.roadWeatherConditions?.title ?? ""),
                createAutoSizeText(
                    provider.roadWeatherConditions?.subtitle ?? ""),
                ImageWithTextCard(
                    imageUrl: "${provider.roadWeatherConditions?.points[1]}",
                    subtitle: "${provider.roadWeatherConditions?.points[0]}"),
                ImageWithTextCard(
                    imageUrl: "${provider.roadWeatherConditions?.points1[1]}",
                    subtitle: "${provider.roadWeatherConditions?.points1[0]}"),
                ImageWithTextCard(
                    imageUrl: "${provider.roadWeatherConditions?.points2[1]}",
                    subtitle: "${provider.roadWeatherConditions?.points2[0]}"),
                ImageWithTextCard(
                    imageUrl: "${provider.roadWeatherConditions?.points3[1]}",
                    subtitle: "${provider.roadWeatherConditions?.points3[0]}"),
                Gap(10),
                createAutoSizeText(
                    provider.roadWeatherConditions?.subtitle1 ?? ""),
                Gap(10),
                createAutoSizeText("Question :"),
                createAutoSizeText(
                    provider.roadWeatherConditions?.question.text ?? ""),
                buildImage(
                    provider.roadWeatherConditions?.question.image ?? ""),
                Gap(10),
                createAutoSizeText("Options :"),
                Column(
                  children: ans!.asMap().entries.map((entry) {
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
                createAutoSizeText("Info :"),
                createAutoSizeText(provider.roadWeatherConditions!.info),
                Gap(10),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(
                        builder: (context) => const YourselfScreen());

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
