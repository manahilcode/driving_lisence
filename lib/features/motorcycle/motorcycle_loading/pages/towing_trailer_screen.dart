import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/towing_trailer.dart';

class TowingTrailerScreen extends StatefulWidget {
  const TowingTrailerScreen({super.key});

  @override
  State<TowingTrailerScreen> createState() => _TowingTrailerScreenState();
}

class _TowingTrailerScreenState extends State<TowingTrailerScreen> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Alertness",
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
        return Column(
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
          ],
        );
      }),
    );
  }
}
