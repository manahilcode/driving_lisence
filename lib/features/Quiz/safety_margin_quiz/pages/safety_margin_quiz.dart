

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../core/loader.dart';
import '../model/model.dart';
import '../viewmodel/controller.dart';

class SafetyMarginQuizScreens extends StatefulWidget {
  const SafetyMarginQuizScreens({super.key}); // Changed to unnamed constructor

  @override
  _SafetyMarginQuizScreensState createState() => _SafetyMarginQuizScreensState();
}

class _SafetyMarginQuizScreensState extends State<SafetyMarginQuizScreens> {
  late SafetyMarginQuizProvider quizProvider;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      quizProvider = Provider.of<SafetyMarginQuizProvider>(context, listen: false);
      quizProvider.fetchQuizzes();
    });
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Safety Margin Quiz',
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<SafetyMarginQuizProvider>(
        builder: (context, provider, child) {
          print(provider.quizzes.length.toString());
          if (provider.isLoading) {
            return const Center(child: LoadingScreen());
          }

          if (provider.quizzes.isEmpty) {
            return const Center(child: Text('No quizzes available'));
          }

          return PageView.builder(
            controller: _pageController,
            itemCount: provider.quizzes.length,
            itemBuilder: (context, index) {
              final quiz = provider.quizzes[index];
              return QuizItem(
                quiz: quiz,
                totalQuestions: provider.quizzes.length,
                pageController: _pageController,
                index:index,
              );
            },
          );
        },
      ),
    );
  }
}

class QuizItem extends StatefulWidget {
  final QuizModel quiz;
  final int totalQuestions;
  final PageController pageController;
  final int index;

  const QuizItem({super.key, required this.quiz, required this.totalQuestions, required this.pageController,required this.index});

  @override
  _QuizItemState createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  int? selectedAnswer;
  bool showInfo = false;

  void handleAnswerSelection(int index) {
    setState(() {
      selectedAnswer = index;
      showInfo = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${widget.index} / "),
                    Text(
                      widget.totalQuestions.toString(),
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                widget.quiz.question,
                style: GoogleFonts.lato(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ...List.generate(widget.quiz.answers.length, (index) {
                final isCorrect = index.toString() == widget.quiz.correct;
                final isSelected = selectedAnswer == index;

                return GestureDetector(
                  onTap: () => handleAnswerSelection(index),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (isCorrect ? Colors.green : Colors.red)
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black.withOpacity(0.5)),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              child: Text(
                                (index + 1).toString(),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.quiz.answers[index],
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              Gap(10),
              if (showInfo)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    widget.quiz.info,
                    style: GoogleFonts.lato(
                        fontSize: 14, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: selectedAnswer != null
                    ? () {
                  // Navigate to the next question
                  if (widget.pageController.page!.toInt() < widget.totalQuestions - 1) {
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    // Optionally, handle the end of the quiz here
                    // e.g., navigate to results screen
                  }
                }
                    : null,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
