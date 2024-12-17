import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/loader.dart';
import '../../viewmodel/factor_effecting_provider.dart';

class FactorEffecting extends StatefulWidget {
  const FactorEffecting({super.key});

  @override
  State<FactorEffecting> createState() => _FactorEffectingState();
}

class _FactorEffectingState extends State<FactorEffecting> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Factor-Effecting-Ability-See",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<FactorEffectingProvider>(
          builder: (context, provider, child) {
        final data = provider.factor;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        final ans = data.answer;
        final correctAnswer = data.correct;
        return Column(
          children: [
            Gap(10),
            createHeadingText(data.title),
            Gap(10),
            createAutoSizeText(data.subtitle),
            Gap(10),
            Row(
              children: [
                buildImage(data.image),
                buildImage(data.image1),
              ],
            ),
            Gap(10),
            Row(
              children: [
                buildImage(data.image2),
                buildImage(data.image3),
              ],
            ),
            Gap(10),
            createAutoSizeText(data.question),
            Gap(10),
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
                      leading: Text(
                          (answerIndex + 1).toString()), // Display index + 1
                      title: Text(answerText), // Display the answer text
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
            createAutoSizeText(data.info),
          ],
        );
      }),
    );
  }
}
