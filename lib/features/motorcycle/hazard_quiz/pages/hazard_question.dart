import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/features/motorcycle/vulnurable_road_user/pages/driver_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../motorcycle_hazard_perception_screen.dart';
import '../model/hazard_quiz.dart'; // Adjust the import based on your file structure
import '../../../../../core/loader.dart';
import '../viewmodel/hazard_question_provider.dart'; // Adjust the import based on your file structure

class HazardQuizPageView extends StatefulWidget {
  const HazardQuizPageView({super.key});

  @override
  _HazardQuizPageViewState createState() => _HazardQuizPageViewState();
}

class _HazardQuizPageViewState extends State<HazardQuizPageView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int _selectedAnswerIndex = -1; // Index of the selected answer

  @override
  void initState() {
    super.initState();
    // Fetch all quizzes when the screen is initialized
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HazardQuizProvider>(context, listen: false);
      provider.fetchAllQuizzes(
          'motorcycle_hazard_quiz'); // Replace with your actual collection name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:
          'Hazard Quiz ',
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {
          Route newRoute = MaterialPageRoute(
              builder: (context) =>
                  const MotorcycleHazardPerceptionScreen());

          Navigator.pushAndRemoveUntil(
            context,
            newRoute,
                (Route<dynamic> route) => false, // Removes all previous routes
          );
        },
      ),
      body: Center(
        child: Consumer<HazardQuizProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return Center(child: LoadingScreen()); // Show loading indicator
            }

            if (provider.errorMessage.isNotEmpty) {
              return Center(
                  child: Text(
                    provider.errorMessage,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )); // Show error message
            }

            if (provider.quizzes.isEmpty) {
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
                    itemCount: provider.quizzes.length,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index; // Update current index
                        _selectedAnswerIndex = -1; // Reset selected answer
                      });
                    },
                    itemBuilder: (context, index) {
                      HazardQuiz quiz = provider.quizzes[index];
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
                                  quiz.question,
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
                                        fontSize: 18, fontWeight: FontWeight.bold)).animate().fadeIn(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                ),
                                SizedBox(height: 16),
                                ...quiz.answer.map((ans) {
                                  int answerIndex = quiz.answer.indexOf(ans); // Get the index of the current answer
                                  bool isCorrect = answerIndex.toString() == quiz.correct;
                        
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: AutoSizeText(
                                        "${answerIndex + 1}.",
                                      ).animate().fadeIn(
                                        curve: Curves.easeIn,
                                        duration: Duration(milliseconds: 500),
                                      ),
                                      title: AutoSizeText('- $ans',textAlign: TextAlign.left,).animate().fadeIn(
                                        curve: Curves.easeIn,
                                        duration: Duration(milliseconds: 500),
                                      ),
                                      tileColor: _selectedAnswerIndex == answerIndex
                                          ? (isCorrect ? Colors.green : Colors.red) // Color based on correctness
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
                                        fontSize: 18, fontWeight: FontWeight.bold)).animate().fadeIn(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),

                                ),
                                SizedBox(height: 16),
                                _selectedAnswerIndex == -1
                                    ? AutoSizeText('Click on an option to see additional information.').animate().fadeIn(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                )
                                    : AutoSizeText(quiz.info.isNotEmpty
                                    ? quiz.info
                                    : 'No additional information available.').animate().fadeIn(
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
                    onPressed: _currentIndex < provider.quizzes.length - 1
                        ? () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                        : null, // Disable button if on the last question
                    child: Text('Next'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}