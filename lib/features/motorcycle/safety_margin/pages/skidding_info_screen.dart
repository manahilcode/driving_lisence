import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/skidding_info_provider.dart';
import 'contraflow_system_Screen.dart';

class SkiddingInfoScreen extends StatefulWidget {
  const SkiddingInfoScreen({super.key});

  @override
  State<SkiddingInfoScreen> createState() => _SkiddingInfoScreenState();
}

class _SkiddingInfoScreenState extends State<SkiddingInfoScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SkiddingInfoNotifier>(context, listen: false);
      provider.fetchSkiddingInfoData();
    });
    super.initState();
  }
  int? selectedAnswerIndex;
  bool isSelect  = false;
  bool isCorrect = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Skidding", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<SkiddingInfoNotifier>(
          builder: (context,provider,child) {
            final data = provider.data;
            if(data == null)
            {
              return LoadingScreen();
            }

            final ans = data.answer;
            final correctAnswer = data.correct;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createHeadingText(data.title),
                    createAutoSizeText(data.subtitle),
                    buildImage(data.image),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    Column(
                      children: data.points1.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                    createAutoSizeText("Question"),
                    createAutoSizeText(data.question),
                    createAutoSizeText("Options"),
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
                      createAutoSizeText("info "),
                    createAutoSizeText(data.info),
                    Gap(10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContraflowSystemScreen(), // Replace with your next screen
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
          }
      ),

    );
  }
}
