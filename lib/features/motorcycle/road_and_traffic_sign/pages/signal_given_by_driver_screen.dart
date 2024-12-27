import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/signal_given_by_driver.dart';

class SignalGivenByDriverScreen extends StatefulWidget {
  const SignalGivenByDriverScreen({super.key});

  @override
  State<SignalGivenByDriverScreen> createState() => _SignalGivenByDriverScreenState();
}

class _SignalGivenByDriverScreenState extends State<SignalGivenByDriverScreen> {
  int? selectedAnswerIndex;
  bool isSelect = false;
  bool isCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<SignalInfoProvider>(
          builder: (context,provider,child) {
            final data = provider.signalInfo;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            final ans= data.answers;
            final correctAnswer = data.correct;

            return Column(
              children: [
                 createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                buildImage(data.image),
                createHeadingText(data.tip),
                Column(
                  children: [
                    createAutoSizeText(data.image[0]),
                    buildImage(data.image[1]),
                  ],
                ),
                Column(
                  children: [
                    createAutoSizeText(data.image1[0].text),
                    buildImage(data.image1[1].url),
                  ],
                ),
                Column(
                  children: [
                    createAutoSizeText(data.image2[0].text),
                    buildImage(data.image2[1].url),
                  ],
                ),

                createAutoSizeText(data.question),
                Column(
                  children: ans!.asMap().entries.map((entry) {
                    int answerKey = entry.key; // Key is a string
                    String answerText = entry.value;
                    int answerIndex = int.tryParse(answerKey.toString()) ?? 0;

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
                          leading: Text(answerKey.toString()),
                          title: Text(answerText),
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

                createAutoSizeText(data.info),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Othertype6(), // Replace with your next screen
                      //   ),
                      // );
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
            );
          }
      ),
    );
  }
}