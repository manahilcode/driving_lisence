import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/loader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../category.dart';
import '../../result/pages/result.dart';
import '../model/model.dart';
import '../viewmodel/controller.dart';

class AttitudeQuizScreens extends StatefulWidget {
  const AttitudeQuizScreens({super.key}); // Changed to unnamed constructor

  @override
  _AttitudeQuizScreensState createState() => _AttitudeQuizScreensState();
}

class _AttitudeQuizScreensState extends State<AttitudeQuizScreens> {
  late AttitudeQuizProvider quizProvider;
  late PageController _pageController;
  int correctAnswersCount = 0;
  List<String> correctQuestions = [];
  List<String> wrongQuestions = [];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      quizProvider = Provider.of<AttitudeQuizProvider>(context, listen: false);
      quizProvider.fetchQuizzes();
      await quizProvider.loadLastQuestionIndex(category!);
      final currentIndex = quizProvider.getCurrentQuestionIndex(category!);

      if (currentIndex > 0) {
        _showResumeDialog();
      }
    });
  }

  void _showResumeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Resume Quiz'),
        content: const Text(
            'Do you want to resume from where you left off or start over?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _pageController.jumpToPage(quizProvider.getCurrentQuestionIndex(category!));
            },
            child: const Text('Resume'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _pageController.jumpToPage(0);
            },
            child: const Text('Start Over'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    quizProvider.saveLastQuestionIndex(category!);
    _pageController.dispose();
    super.dispose();
  }

  final String? category = "Attitude_Quiz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attitude Quiz',
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<AttitudeQuizProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: LoadingScreen());
          }
          if (provider.quizzes.isEmpty) {
            return const Center(child: Text('No quizzes available'));
          }
          final currentIndex = provider.getCurrentQuestionIndex(category!);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Correct Answers: $correctAnswersCount',
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: provider.quizzes.length,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    quizProvider.updateQuestionIndex(category!,index);
                  },
                  itemBuilder: (context, index) {
                    final quiz = provider.quizzes[index];
                    return QuizItem(
                      quiz: quiz,
                      totalQuestions: provider.quizzes.length,
                      pageController: _pageController,
                      index: index,
                      onCorrectAnswer: () {
                        setState(() {
                          correctAnswersCount++;
                          if (!correctQuestions.contains(quiz.question)) {
                            correctQuestions.add(quiz
                                .question); // Add to correct list only if it's not already added
                          }
                        });
                        print(correctAnswersCount.toString());
                      },
                      onWrongAnswer: () {
                        setState(() {
                          if (!wrongQuestions.contains(quiz.question)) {
                            wrongQuestions.add(quiz
                                .question); // Add to wrong list only if it's not already added
                          } // Add to wrong list
                        });
                      },
                      category: "$category",
                      correctAnswersCount: correctAnswersCount,
                      correctQuestions: correctQuestions,
                      wrongQuestions: wrongQuestions,
                      currentIndex: currentIndex,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class QuizItem extends StatefulWidget {
  String? category;
  final QuizModel quiz;
  final int totalQuestions;
  final PageController pageController;
  final int index;
  final VoidCallback onCorrectAnswer; // Callback for correct answer
  final VoidCallback onWrongAnswer; // Callback for wrong answer
  final int correctAnswersCount; // Add correctAnswersCount parameter
  final List<String> correctQuestions; // Pass correct questions
  final List<String> wrongQuestions; // Pass wrong questions
  final int currentIndex;


  QuizItem(
      {super.key,
      required this.quiz,
      this.category,
      required this.totalQuestions,
      required this.pageController,
      required this.index,
      required this.onCorrectAnswer,
      required this.onWrongAnswer,
      required this.correctAnswersCount,
      required this.correctQuestions,
      required this.wrongQuestions,
        required this.currentIndex
      });

  @override
  _QuizItemState createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  int? selectedAnswer;
  bool showInfo = false;
  String feedbackMessage = '';

  void handleAnswerSelection(int index) {
    setState(() {
      selectedAnswer = index;
      showInfo = true;

      // Check if the selected answer is correct
      final isCorrect = index.toString() == widget.quiz.correct;
      feedbackMessage = isCorrect ? 'Correct!' : 'Incorrect!';

      // Call the appropriate callback based on correctness
      if (isCorrect) {
        widget.onCorrectAnswer();
      } else {
        widget.onWrongAnswer();
      }
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
                              child: AutoSizeText(
                                widget.quiz.answers[index],
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
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
                if (showInfo) const Gap(10),
              Column(
                children: [
                  Text(
                    feedbackMessage,
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: feedbackMessage == "Correct!"
                            ? Colors.green
                            : Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(10),
                  if (showInfo)
                    Text(
                      widget.quiz.info, // Display additional info if needed
                      style: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: selectedAnswer != null
                    ? () {
                        // Navigate to the next question
                        if (widget.pageController.page!.toInt() <
                            widget.totalQuestions - 1) {
                          widget.pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          Route newRoute = MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                    correctAnswer:
                                        widget.correctAnswersCount.toString(),
                                    wrongAnswers: widget
                                        .wrongQuestions, // Pass the list of wrong questions
                                    correctQuestions: widget.correctQuestions,
                                    catType: widget.category,
                                    totalQuestion:
                                        widget.totalQuestions.toString(),
                                    currentQuestionIndex: widget.currentIndex,
                                  ));

                          Navigator.pushAndRemoveUntil(
                            context,
                            newRoute,
                            (Route<dynamic> route) =>
                                false, // Removes all previous routes
                          );
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
