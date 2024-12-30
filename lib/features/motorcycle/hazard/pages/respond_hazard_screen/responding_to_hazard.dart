import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/loader.dart';
import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../viewmodel/responding_hazard_provider.dart';

class RespondingToHazard extends StatefulWidget {
  const RespondingToHazard({super.key});

  @override
  State<RespondingToHazard> createState() => _RespondingToHazardState();
}

class _RespondingToHazardState extends State<RespondingToHazard> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  int? selectedAnswerIndex1;
  bool isCorrect1 = false;
  bool isSelect1 = false;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controllers using Future.microtask
    Future.microtask(() {
      final provider =
          Provider.of<RespondingToHazardsProvider>(context, listen: false);
         provider.fetchRespondingToHazards("Responding_to_hazards");
      final url1 = provider.respondingToHazards?.video ?? "";
      final url2 = provider.respondingToHazards?.video1 ?? "";
      final url3 = provider.respondingToHazards?.video2 ?? "";

      _controller1 = VideoPlayerController.network(url1)
        ..initialize().then((_) {
          setState(() {}); // Update the UI when the first video is initialized
        });

      _controller2 = VideoPlayerController.network(url2)
        ..initialize().then((_) {
          setState(() {}); // Update the UI when the second video is initialized
        });

      _controller3 = VideoPlayerController.network(url3)
        ..initialize().then((_) {
          setState(() {}); // Update the UI when the third video is initialized
        });
    });
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Responding to hazard",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {
            Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

            Navigator.pushAndRemoveUntil(
              context,
              newRoute,
                  (Route<dynamic> route) => false, // Removes all previous routes
            );
          }),
      body: Consumer<RespondingToHazardsProvider>(
          builder: (context, provider, child) {
        final data = provider.respondingToHazards;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        final ans = data.answer;
        final ans1 = data.answer2;
        final correctAnswer = data.correct;
        final correctAnswer1 = data.correct1;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(_controller1),
                ),
                createAutoSizeText(data.subtitle1),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(_controller2),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildTipWidget(data.tip),
                ),
                Gap(10),
                Column(
                  children: data.points
                      .map((e) => buildBulletText(e.toString()))
                      .toList(),
                ),
                Gap(10),
                createAutoSizeText(data.subtitle2),
                Gap(10),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(_controller3),
                ),
                Gap(10),
                createAutoSizeText(data.question),
                Gap(10),
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
                Gap(10),
                createAutoSizeText(data.question1),
                Gap(10),
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
                              ? answerText == correctAnswer
                                  ? Colors.green.withOpacity(0.7)
                                  : selectedAnswerIndex1 == answerIndex
                                      ? Colors.red.withOpacity(0.7)
                                      : null
                              : null,
                          leading: Text(
                              (answerIndex + 1).toString()), // Display index + 1
                          title: Text(answerText), // Display the answer text
                          trailing: selectedAnswerIndex1 != null
                              ? answerText == correctAnswer
                                  ? Icon(Icons.check,
                                      color: Colors.green) // Correct answer
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


                createAutoSizeText(data.info1),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

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
