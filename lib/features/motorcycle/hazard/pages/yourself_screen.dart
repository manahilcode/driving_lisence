import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/loader.dart';
import '../viewmodel/your_provider.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Your-Self",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body:
          Consumer<MotorcycleYourProvider>(builder: (context, provider, child) {
            final data = provider.motorcycleAnswers;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            final ans = data[0].answer;
            final correctAnswer = data[0].correct;
            final ans2 = data[0].answer2;
            final correctAnswer2 = data[0].correct2;
        return Column(
          children: [
            createHeadingText(provider.motorcycleAnswers[0].title),
            createAutoSizeText(provider.motorcycleAnswers[0].subtitle),
            Gap(10),
            createHeadingText(provider.motorcycleAnswers[0].title1),
            createAutoSizeText(provider.motorcycleAnswers[0].subtitle1),
            Gap(10),
            createHeadingText(provider.motorcycleAnswers[0].title2),
            Gap(02),
            Column(
              children: provider.motorcycleAnswers[0].subtitle2!
                  .map(
                    (stringItem) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        stringItem, // Display the string in a Text widget
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  )
                  .toList(), // Convert the iterable to a List<Widget>
            ),
            Gap(10),
            createHeadingText(provider.motorcycleAnswers[0].title3),
            Column(
              children: provider.motorcycleAnswers[0].subtitle3
                  .map(
                    (stringItem) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        stringItem, // Display the string in a Text widget
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  )
                  .toList(), // Convert the iterable to a List<Widget>
            ),
            Gap(10),
            createAutoSizeText(provider.motorcycleAnswers[0].question),
            Gap(10),
            buildTipWidget(provider.motorcycleAnswers[0].tip[0]),
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
            createHeadingText(provider.motorcycleAnswers[0].title4),
            createAutoSizeText(provider.motorcycleAnswers[0].subtitle4),
            Gap(10),
            createAutoSizeText(provider.motorcycleAnswers[0].question2),
            Gap(10),
            Column(
              children: ans2.asMap().entries.map((entry) {
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
                  children: provider.motorcycleAnswers
                      .expand((answer) => answer.points.map((point) => buildBulletText(point)))
                      .toList(), // Convert to List<Widget>
                ),
              ),
            ),
            createHeadingText(provider.motorcycleAnswers[0].title5),
            createAutoSizeText(provider.motorcycleAnswers[0].subtitle5),
          ],
        );
      }),
    );
  }
}
