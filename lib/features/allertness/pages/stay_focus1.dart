import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/allertness/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import 'meeting_standard.dart';

class StayFocused1 extends StatefulWidget {
  const StayFocused1({super.key});

  @override
  State<StayFocused1> createState() => _StayFocused1State();
}

class _StayFocused1State extends State<StayFocused1> {
  AlertController? _alertController;
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  @override
  void didChangeDependencies() {
    _alertController = Provider.of<AlertController>(context, listen: false);
    _alertController?.fetchDistraction();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stay Focus",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<AlertController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.distraction;

          if (data == null) {
            return const LoadingScreen();
          }

          final ans = data.answers;
          final correctAnswer = data.correct;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title),
                  buildImage(data.image1),
                  createAutoSizeText(data.subtitle),
                  buildImage(data.image2),
                  createAutoSizeText(data.subtitle2),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          buildBulletText(data.points[0]),
                          buildBulletText(data.points[1]),
                          buildBulletText(data.points[2]),
                          buildBulletText(data.points[3]),
                          buildBulletText(data.points[4]),
                        ],
                      ),
                    ),
                  ),
                  createAutoSizeText(data.subtitle3),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      "Q : ${data.question}",
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),

                    ),
                  ),

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

                  const AutoSizeText("Answers",style: TextStyle(color: Colors.green),),
                  const Gap(10),
                  Opacity(
                    opacity: isSelect ? 1 : 0,
                      child: createAutoSizeText(data.correct)),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const MeetingStandardAlertness()),
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
                              offset: const Offset(0, 3),
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
        },
      ),
    );
  }
}
