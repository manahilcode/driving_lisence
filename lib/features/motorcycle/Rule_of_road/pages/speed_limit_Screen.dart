import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/speed_limit.dart';

class SpeedLimitScreen extends StatefulWidget {
  const SpeedLimitScreen({super.key});

  @override
  State<SpeedLimitScreen> createState() => _SpeedLimitScreenState();
}

class _SpeedLimitScreenState extends State<SpeedLimitScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BreakdownProvider>(context, listen: false);
      provider.fetchBreakdown("Animals_on_the_road");
    });
    super.initState();
  }
  int? selectedAnswerIndex;
  bool isCorrect =false;
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<SpeedLimitsNotifier>(
          builder: (context,provider,child) {
            final data = provider!.speedLimits;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }

            final ans = data.answers;
            final correctAnswer = data.correctAnswer;

            return Column(
              children: [
               createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                buildImage(data.image1),
                buildTipWidget(data.tip),
                createAutoSizeText(data.subtitle1),
                createAutoSizeText(data.tip2),
                buildTipWidget(data.tip3),
                Column(
                  children: data.points.map((e)=>buildBulletText(e.toString())).toList(),

                ),

                createAutoSizeText(data.subtitle3),
                Column(
                  children: [
                    createAutoSizeText(data.image[0].description),
                    buildImage(data.image[1].url),
                  ],
                ),
                Column(
                  children: [
                    createAutoSizeText(data.image2[0].description),
                    buildImage(data.image2[1].url),
                  ],
                ),
                Column(
                  children: [
                    createAutoSizeText(data.image3[0].description),
                    buildImage(data.image3[1].url),
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
