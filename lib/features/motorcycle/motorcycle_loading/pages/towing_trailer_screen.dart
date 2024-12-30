import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/towing_trailer.dart';
import 'meeting_standard_screen.dart';

class TowingTrailerScreen extends StatefulWidget {
  const TowingTrailerScreen({super.key});

  @override
  State<TowingTrailerScreen> createState() => _TowingTrailerScreenState();
}

class _TowingTrailerScreenState extends State<TowingTrailerScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TowingTrailerNotifier>(context, listen: false);
      provider.loadTowingTrailer("Towing_a_trailer");
    });
    super.initState();
  }
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "towing trailer",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body:
          Consumer<TowingTrailerNotifier>(builder: (context, provider, child) {
        final data = provider.towingTrailer;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        final ans = data.answer;
        final correctAnswer = data.correct;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data.title),
                buildImage(data.image),
                Column(
                  children: data.points
                      .map((e) => buildBulletText(e.toString()))
                      .toList(),
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
                //MeetingStandardScreenLoading
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MeetingStandardScreenLoading(), // Replace with your next screen
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
