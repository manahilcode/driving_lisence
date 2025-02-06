import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../core/facebook_ads.dart';
import '../../features/Quiz/result/pages/c_and_w_question.dart';


class LorryResultScreen extends StatefulWidget {
  final String? correctAnswer;
  final String? catType;
  final String? totalQuestion;
  final List<String> correctQuestions; // Store correct questions
  final List<String> wrongAnswers; // Store wrong questions
  final int currentQuestionIndex;

  LorryResultScreen({
    super.key,
    this.correctAnswer,
    this.catType,
    this.totalQuestion,
    required this.correctQuestions,
    required this.wrongAnswers,
    required this.currentQuestionIndex,
  });

  @override
  State<LorryResultScreen> createState() => _LorryResultScreenState();
}

class _LorryResultScreenState extends State<LorryResultScreen> {
  double calculatePercentage() {
    int correct = int.parse(widget.correctAnswer ?? "");
    int total = int.parse(widget.totalQuestion!);

    // Check to prevent division by zero
    if (total == 0) return 0.0;

    // Calculate percentage of correct answers
    return (correct / total) * 100;
  }
  FacebookAdsProvider? _facebookAdsProvider;

   @override
  void didChangeDependencies() {
     _facebookAdsProvider = Provider.of<FacebookAdsProvider>(context,listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double percentageValue = calculatePercentage();
    double percentageForIndicator =
        percentageValue / 100; // Convert to 0-1 range
    percentageForIndicator = percentageForIndicator.clamp(0.0, 1.0);

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const AutoSizeText(
          "Test Result",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.backspace_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AutoSizeText(
                "Keep going",
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.07, // Responsive font size
                ),
              ),
              const Gap(20),
              Material(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText("Your Score"),
                              AutoSizeText(
                                "${widget.correctAnswer ?? 0}/${widget.totalQuestion ?? 0}" ,
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth *
                                        0.08, // Responsive font size
                                    color: Colors.green),
                              ),
                              AutoSizeText(
                                "The pass Mark is 43/50",
                                style: GoogleFonts.lato(color: Colors.grey),
                              ),
                              const Gap(10),
                              const AutoSizeText("Question type"),
                              const Gap(10),
                              AutoSizeText(
                                "${widget.catType ?? ""}",
                                style: GoogleFonts.lato(color: Colors.grey),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              CircularPercentIndicator(
                                radius: screenWidth * 0.15, // Responsive size
                                lineWidth: 20.0,
                                percent: percentageForIndicator,
                                center: Text(
                                    "${percentageValue.toStringAsFixed(2)}%'" ?? ""),
                                progressColor: Colors.green,
                                animation: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.black12,
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            AutoSizeText(
                              "Best category",
                              style: GoogleFonts.lato(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            AutoSizeText(
                              "Attitude",
                              style: GoogleFonts.lato(color: Colors.grey),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Column(
                          children: [
                            AutoSizeText(
                              "Worst category",
                              style: GoogleFonts.lato(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            AutoSizeText(
                              "Safety",
                              style: GoogleFonts.lato(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.black12,
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            AutoSizeText(
                              "Time Taken",
                              style: GoogleFonts.lato(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            AutoSizeText(
                              "0:59 mins",
                              style: GoogleFonts.lato(color: Colors.grey),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Column(
                          children: [
                            AutoSizeText(
                              "Time Remaining",
                              style: GoogleFonts.lato(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            AutoSizeText(
                              "56:01 mins",
                              style: GoogleFonts.lato(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AutoSizeText(
                    "What to do next",
                    style: GoogleFonts.lato(
                      fontSize: screenWidth * 0.05, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Gap(1),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AutoSizeText(
                  "It's important to review your answers so you can see the areas you need to improve for next time.",
                  style: GoogleFonts.lato(color: Colors.grey),
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () async {
                  final user =  FirebaseAuth.instance.currentUser?.uid;
                  await FirebaseFirestore.instance
                      .collection("result")
                      .doc(widget.catType)
                      .set({
                    "category": widget.catType,
                    "totalQuestion": widget.totalQuestion,
                    "correctQuestion": widget.correctAnswer,
                    "userId": user,
                    "currentIndex":widget.currentQuestionIndex,
                  });
                  Route newRoute = MaterialPageRoute(
                      builder: (context) => CorrectWrongQuestion(
                        wrongAnswers: widget
                            .wrongAnswers, // Pass the list of wrong questions
                        correctQuestions: widget.correctQuestions,
                      ));

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) =>
                    false, // Removes all previous routes
                  );
                },
                child: Container(
                  width: screenWidth * 0.5, // Responsive width
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Review your answers",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontSize: screenWidth * 0.04),
                    ),
                  ),
                ),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth * 0.5, // Responsive width
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Review your answers",
                      style: GoogleFonts.lato(
                          color: Colors.green, fontSize: screenWidth * 0.04),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: _facebookAdsProvider?.showBannerAd(),
      ),

    );
  }
}
