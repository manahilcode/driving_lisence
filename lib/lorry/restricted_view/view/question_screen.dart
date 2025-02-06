import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/facebook_ads.dart';
import '../../../core/loader.dart';
import '../../result/result.dart';
import '../model/model.dart';
import '../viewmodel/question_controller.dart';

class RestrictedViewScreen extends StatefulWidget {
  const RestrictedViewScreen({super.key});

  @override
  State<RestrictedViewScreen> createState() => _RestrictedViewScreenState();
}

class _RestrictedViewScreenState extends State<RestrictedViewScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int _selectedAnswerIndex = -1; // Index of the selected answer
  FacebookAdsProvider? _facebookAdsProvider;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<LorryRestrictedProvider>(context, listen: false);
      _facebookAdsProvider = Provider.of<FacebookAdsProvider>(context,listen: false);

      provider.loadLorryData();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getCurrentIndex();
    super.didChangeDependencies();
  }

  /// call savecurrentindex function
  void saveCurrentIndex() {
    final provider =
        Provider.of<LorryRestrictedProvider>(context, listen: false);
    provider.saveCurrentIndex(_currentIndex);
  }

  /// call get current index function
  void getCurrentIndex() async {
    final provider =
        Provider.of<LorryRestrictedProvider>(context, listen: false);
    _currentIndex = await provider.getCurrentIndex();
  }

  void category() async {
    final provider =
        Provider.of<LorryRestrictedProvider>(context, listen: false);
    provider.saveCategory("Restricted View");
  }

  void totalQuestion(int total) async {
    final provider =
        Provider.of<LorryRestrictedProvider>(context, listen: false);
    provider.saveCurrentQuestionIndex(total);
  }

  void correctAnswer(List<String> correctAnswers) {
    final provider =
        Provider.of<LorryRestrictedProvider>(context, listen: false);
    provider.saveCorrectAnswer(correctAnswers);
  }

  void wrongAnswer(List<String> wrongAnswers) {
    final provider =
        Provider.of<LorryRestrictedProvider>(context, listen: false);
    provider.saveWrongAnswer(wrongAnswers);
  }

  List<String> correctList = [];
  List<String> wrongList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Center(
        child: Consumer<LorryRestrictedProvider>(
          builder: (context, provider, child) {
            final data = provider.lorryModels;
            totalQuestion(data.length);
            if (provider.isLoading) {
              return Center(child: LoadingScreen()); // Show loading indicator
            }

            if (provider.lorryModels.isEmpty) {
              return Center(
                  child: Text(
                'No quizzes available.',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )); // Show message if no quizzes
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Flexible(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: provider.lorryModels.length,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index; // Update current index
                        _selectedAnswerIndex = -1; // Reset selected answer
                      });
                    },
                    itemBuilder: (context, index) {
                      LorryModel quiz = provider.lorryModels[index];
                      saveCurrentIndex();
                      return SingleChildScrollView(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // show question number
                                Text(
                                  'Question ${index + 1}',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ).animate().fadeIn(
                                      curve: Curves.easeIn,
                                      duration: Duration(milliseconds: 500),
                                    ), // Add fade animation

                                SizedBox(height: 16),
                                Text(
                                  quiz.question!,
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ).animate().fadeIn(
                                      curve: Curves.easeIn,
                                      duration: Duration(milliseconds: 500),
                                    ),
                                SizedBox(height: 16),
                                AutoSizeText('Answers:',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                    .animate()
                                    .fadeIn(
                                      curve: Curves.easeIn,
                                      duration: Duration(milliseconds: 500),
                                    ),
                                SizedBox(height: 16),
                                ...quiz.answer.map((ans) {
                                  int answerIndex = quiz.answer.indexOf(
                                      ans); // Get the index of the current answer
                                  bool isCorrect =
                                      answerIndex.toString() == quiz.correct;

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: AutoSizeText(
                                        "${answerIndex + 1}.",
                                      ).animate().fadeIn(
                                            curve: Curves.easeIn,
                                            duration:
                                                Duration(milliseconds: 500),
                                          ),
                                      title: AutoSizeText(
                                        '$ans',
                                        textAlign: TextAlign.left,
                                      ).animate().fadeIn(
                                            curve: Curves.easeIn,
                                            duration:
                                                Duration(milliseconds: 500),
                                          ),
                                      tileColor: _selectedAnswerIndex ==
                                              answerIndex
                                          ? (isCorrect
                                              ? Colors.green
                                              : Colors
                                                  .red) // Color based on correctness
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          color: Colors.green,
                                          width: 2,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 2),
                                      onTap: () {
                                        setState(() {
                                          _selectedAnswerIndex = answerIndex;
                                          if (isCorrect) {
                                            correctList.add(quiz.question!);
                                            correctAnswer(correctList);
                                          } else {
                                            wrongList.add(quiz.question!);
                                            wrongAnswer(wrongList);
                                          }
                                        });
                                      },
                                    ).animate().fade(
                                          curve: Curves.easeIn,
                                          duration: Duration(milliseconds: 500),
                                        ),
                                  );
                                }).toList(),
                                SizedBox(height: 16),
                                AutoSizeText('Additional Info:',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                    .animate()
                                    .fadeIn(
                                      curve: Curves.easeIn,
                                      duration: Duration(milliseconds: 500),
                                    ),
                                SizedBox(height: 16),
                                _selectedAnswerIndex == -1
                                    ? AutoSizeText(
                                            'Click on an option to see additional information.')
                                        .animate()
                                        .fadeIn(
                                          curve: Curves.easeIn,
                                          duration: Duration(milliseconds: 500),
                                        )
                                    : AutoSizeText(quiz.info!.isNotEmpty
                                            ? quiz.info!
                                            : 'No additional information available.')
                                        .animate()
                                        .fadeIn(
                                          curve: Curves.easeIn,
                                          duration: Duration(milliseconds: 500),
                                        ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _currentIndex < provider.lorryModels.length - 1
                        ? () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                        : () async {
                      final provider =
                      Provider.of<LorryRestrictedProvider>(
                          context,
                          listen: false);
                      final correctAnswer =
                      await provider.getCorrectAnswer();
                      final wrongAnswers =
                      await provider.getWrongAnswer();
                      final currentQuestionIndex = _currentIndex;
                      final totalQuestion =
                      await provider.getTotalQuestion();
                      final category = await provider.getCategory();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LorryResultScreen(
                            correctQuestions: correctAnswer,
                            wrongAnswers: wrongAnswers,
                            currentQuestionIndex: currentQuestionIndex,
                            totalQuestion: totalQuestion.toString(),
                            catType: category,
                          ),
                        ),
                      );
                    }, // Navigate to results page if on the last question
                    child: Text('Next'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: _facebookAdsProvider?.showBannerAd(),
      ),
    );
  }
}
