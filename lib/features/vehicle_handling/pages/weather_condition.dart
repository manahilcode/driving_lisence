import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/pages/fog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';

class WeatherCondition extends StatefulWidget {
  const WeatherCondition({super.key});

  @override
  State<WeatherCondition> createState() => _WeatherConditionState();
}

class _WeatherConditionState extends State<WeatherCondition> {

var futureData;
  @override
  void didChangeDependencies() async{
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<IntroductionController>(context, listen: false).getWeatherCondition();

    });

    await Provider.of<IntroductionController>(context, listen: false).getWeatherCondition();
    super.didChangeDependencies();
  }

int? selectedAnswerIndex;
bool isCorrect = false;
bool isSelect = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Condition",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IntroductionController>(
        builder: (context, value, child) {

          if (value.weatherCondition != null) {
            final data = value.weatherCondition;
            final ans = data?.answers;
            final correctAnswer = data?.correctAnswer;
            if(data == null)
              {
                return const LoadingScreen();
              }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createHeadingText(data!.title),
                    createAutoSizeText(data.subtitle!),
                    createHeadingText(data.title2),
                    createAutoSizeText(data.subtitle2!),
                    const Gap(10),
                    createAutoSizeText(data.question),
                    const Gap(10),
                    Column(
                      children: ans!.entries.map((entry) {
                        String answerKey = entry.key; // Key is a string
                        String answerText = entry.value;
                        int answerIndex = int.tryParse(answerKey) ?? 0;

                        return Padding(
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
                            child: ListTile(
                              tileColor: selectedAnswerIndex != null
                                  ? answerText == correctAnswer
                                  ? Colors.green.withOpacity(0.7)
                                  : selectedAnswerIndex == answerIndex
                                  ? Colors.red.withOpacity(0.7)
                                  : null
                                  : null,
                              leading: Text(answerKey),
                              title: Text(answerText),
                              trailing: selectedAnswerIndex != null
                                  ? answerText == correctAnswer
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : selectedAnswerIndex == answerIndex
                                  ? const Icon(Icons.close, color: Colors.red)
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
                      createHeadingText("Answer"),
                    Opacity(
                        opacity: isSelect ? 1 : 0,
                        child: AutoSizeText(data.correctAnswer)),

                    buildImage(data.imageUrl),

                    createAutoSizeText(data.subtitle3!),
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


                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Route newRoute = MaterialPageRoute(builder: (context) => const FogScreen());

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
          } else {
            return Column(
              children: [
                const Center(child: LoadingScreen()),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(builder: (context) => const FogScreen());

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
            ); // Show a loading indicator while fetching data
          }
        },
      ),

    );
  }
}
