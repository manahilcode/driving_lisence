import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    // Fetch all quizzes when the screen is initialized
    final provider = Provider.of<HazardQuizProvider>(context, listen: false);
    provider.fetchAllQuizzes(
        'motorcycle_hazard_quiz'); // Replace with your actual collection name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hazard Quiz'),
        leading: IconButton(
            onPressed: () {
              Route newRoute = MaterialPageRoute(
                  builder: (context) =>
                      const MotorcycleHazardPerceptionScreen());

              Navigator.pushAndRemoveUntil(
                context,
                newRoute,
                (Route<dynamic> route) => false, // Removes all previous routes
              );
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Consumer<HazardQuizProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: LoadingScreen()); // Show loading indicator
          }

          if (provider.errorMessage.isNotEmpty) {
            return Center(
                child: Text(provider.errorMessage)); // Show error message
          }

          if (provider.quizzes.isEmpty) {
            return Center(
                child: Text(
                    'No quizzes available.')); // Show message if no quizzes
          }

          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: provider.quizzes.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index; // Update current index
                    });
                  },
                  itemBuilder: (context, index) {
                    HazardQuiz quiz = provider.quizzes[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quiz.question,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 16),
                          Text('Answers:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          ...quiz.answer.map((ans) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text('- $ans'),
                              )),
                          SizedBox(height: 16),
                          Text('Additional Info:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(quiz.info.isNotEmpty
                              ? quiz.info
                              : 'No additional information available.'),
                        ],
                      ),
                    );
                  },
                ),
              ),
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
    );
  }
}
