import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/hazard/pages/road_weather_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/imagewithtext.dart';
import '../../../../core/loader.dart';
import '../../../motorcycle_hazard_perception_screen.dart';
import '../viewmodel/static_hazard_provider.dart';
import 'hazard_screen.dart';

class StaticHazardScreen extends StatefulWidget {
  const StaticHazardScreen({super.key});

  @override
  State<StaticHazardScreen> createState() => _StaticHazardScreenState();
}

class _StaticHazardScreenState extends State<StaticHazardScreen> {
  @override
  void initState() {
    Future.microtask(() {
      final controller = Provider.of<MotorcycleStaticHazardProvider>(context, listen: false);
      controller.fetchMotorcycleStaticHazard("motorcycle_hazard", "static_hazard");
    });
    super.initState();
  }

  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;

  int? selectedAnswerIndex1;
  bool isCorrect1 = false;
  bool isSelect1 = false;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Static Hazard",

          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {
            Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

            Navigator.pushAndRemoveUntil(
              context,
              newRoute,
                  (Route<dynamic> route) => false, // Removes all previous routes
            );
          }),
      body: Consumer<MotorcycleStaticHazardProvider>(
          builder: (context, provider, child) {
        final data = provider.motorcycleStaticHazard;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        final ans1 = data.answer1;
        final ans2 = data.answer2;

        final correctAnswer1 = data.correct1;
        final correctAnswer2 = data.correct2;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(provider.motorcycleStaticHazard?.title ?? ""),
                createAutoSizeText(
                    provider.motorcycleStaticHazard?.subtitle ?? ""),
                ImageWithTextCard(
                  imageUrl:
                      '${provider.motorcycleStaticHazard?.images[0].image}',
                  subtitle:
                      '${provider.motorcycleStaticHazard?.images[0].name}',
                ),
                ImageWithTextCard(
                  imageUrl:
                      '${provider.motorcycleStaticHazard?.images[1].image}',
                  subtitle:
                      '${provider.motorcycleStaticHazard?.images[1].name}',
                ),
                ImageWithTextCard(
                  imageUrl:
                      '${provider.motorcycleStaticHazard?.images[2].image}',
                  subtitle:
                      '${provider.motorcycleStaticHazard?.images[2].name}',
                ),
                ImageWithTextCard(
                  imageUrl:
                      '${provider.motorcycleStaticHazard?.images[3].image}',
                  subtitle:
                      '${provider.motorcycleStaticHazard?.images[3].name}',
                ),
                ImageWithTextCard(
                  imageUrl:
                      '${provider.motorcycleStaticHazard?.images[4].image}',
                  subtitle:
                      '${provider.motorcycleStaticHazard?.images[4].name}',
                ),
                ImageWithTextCard(
                  imageUrl:
                      '${provider.motorcycleStaticHazard?.images[5].image}',
                  subtitle:
                      '${provider.motorcycleStaticHazard?.images[5].name}',
                ),
                ImageWithTextCard(
                  imageUrl:
                      '${provider.motorcycleStaticHazard?.images[6].image}',
                  subtitle:
                      '${provider.motorcycleStaticHazard?.images[6].name}',
                ),
                ImageWithTextCard(
                  imageUrl:
                      '${provider.motorcycleStaticHazard?.images[7].image}',
                  subtitle:
                      '${provider.motorcycleStaticHazard?.images[7].name}',
                ),
                Gap(10),
                createAutoSizeText("Question :"),
                createAutoSizeText(
                    provider.motorcycleStaticHazard?.question1.text ?? ""),
                buildImage(
                    provider.motorcycleStaticHazard?.question1.image ?? ""),
                Gap(10),
                createAutoSizeText("Options :"),
                Column(
                  children: ans1.asMap().entries.map((entry) {
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
                              ? answerText == correctAnswer1
                                  ? Colors.green.withOpacity(0.7)
                                  : selectedAnswerIndex == answerIndex
                                      ? Colors.red.withOpacity(0.7)
                                      : null
                              : null,
                          leading: AutoSizeText((answerIndex + 1)
                              .toString()), // Display index + 1
                          title: AutoSizeText(answerText), // Display the answer text
                          trailing: selectedAnswerIndex != null
                              ? answerText == correctAnswer1
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
                                    isCorrect = answerText == correctAnswer1;
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
                createAutoSizeText("Info :"),
                createAutoSizeText(
                    provider.motorcycleStaticHazard?.info1 ?? ""),
                Gap(10),
                createAutoSizeText("Question :"),
                createAutoSizeText(
                    provider.motorcycleStaticHazard?.question2.text ?? ""),
                buildImage(
                    provider.motorcycleStaticHazard?.question2.image ?? ""),
                Gap(10),
                createAutoSizeText("Options :"),
                Column(
                  children: ans1.asMap().entries.map((entry) {
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
                          tileColor: selectedAnswerIndex1 != null
                              ? answerText == correctAnswer2
                                  ? Colors.green.withOpacity(0.7)
                                  : selectedAnswerIndex1 == answerIndex
                                      ? Colors.red.withOpacity(0.7)
                                      : null
                              : null,
                          leading: AutoSizeText((answerIndex + 1)
                              .toString()), // Display index + 1
                          title: AutoSizeText(answerText), // Display the answer text
                          trailing: selectedAnswerIndex1 != null
                              ? answerText == correctAnswer2
                                  ? Center(
                                    child: Icon(Icons.check,
                                        color: Colors.green),
                                  ) // Correct answer
                                  : selectedAnswerIndex1 == answerIndex
                                      ? Icon(Icons.close,
                                          color: Colors.red) // Wrong answer
                                      : null
                              : null,
                          onTap: selectedAnswerIndex1 == null
                              ? () {
                                  setState(() {
                                    selectedAnswerIndex1 = answerIndex;
                                    isCorrect1 = answerText == correctAnswer1;
                                    isSelect1 = true;
                                  });
                                }
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                createAutoSizeText("Info :"),
                createAutoSizeText(
                    provider.motorcycleStaticHazard?.info2 ?? ""),
                Gap(10),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(builder: (context) => const RoadWeatherConditionScreen());

                    Navigator.pushAndRemoveUntil(
                      context,
                      newRoute,
                          (Route<dynamic> route) => false, // Removes all previous routes
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
