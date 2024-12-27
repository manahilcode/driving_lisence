import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/avoid_tiredness_provider.dart';
import 'keep_warm.dart';

class AvoidTirednessScreen extends StatefulWidget {
  const AvoidTirednessScreen({super.key});

  @override
  State<AvoidTirednessScreen> createState() => _AvoidTirednessScreenState();
}

class _AvoidTirednessScreenState extends State<AvoidTirednessScreen> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  @override
  void initState() {
    // TODO: implement
    //Avoiding_tiredness
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AvoidingTirednessProvider>(context, listen: false);
      provider.fetchAvoidingTirednessData("motorcycle_alertness", "Avoiding_tiredness");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Avoid Tiredness",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<AvoidingTirednessProvider>(
          builder: (context, provider, child) {
        final data = provider.data;
        final ans = data?.answer;
        final correctAnswer = data?.correct;

        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               createHeadingText("Avoid Tiredness"),
                createAutoSizeText(data.subtitle),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildTipWidget(data.tip),
                ),
                Column(
                  children: data.points
                      .map((e) => buildBulletText(e.toString()))
                      .toList(),
                ),
                createAutoSizeText(data.subtitle),
                createAutoSizeText("Question"),
                createAutoSizeText(data.question),
                Column(
                  children: ans!.asMap().entries.map((entry) {
                    int answerKey = entry.key; // Key is a string
                    String answerText = entry.value;
                    int answerIndex = answerKey ?? 0;

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
                          dense: true,
                          tileColor: selectedAnswerIndex != null
                              ? answerText == correctAnswer
                                  ? Colors.green.withOpacity(0.7)
                                  : selectedAnswerIndex == answerIndex
                                      ? Colors.red.withOpacity(0.7)
                                      : null
                              : null,
                          leading: AutoSizeText(answerKey.toString()),
                          title: AutoSizeText(answerText),
                          trailing: selectedAnswerIndex != null
                              ? answerText == correctAnswer
                                  ? Icon(Icons.check, color: Colors.green)
                                  : selectedAnswerIndex == answerIndex
                                      ? Icon(Icons.close, color: Colors.red)
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
                createAutoSizeText("Info"),
                createAutoSizeText(data.info),
                Gap(10),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KeepWarmScreen(), // Replace with your next screen
                        ),
                      );
                    },
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 30.0,
                      ),
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
                      child: Center(
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
