import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../allertness/repo/repo.dart';
import '../../Alerness_quiz/model/alernessmodel.dart';
import '../repo/essentialdocrepo.dart';


class MotorcycleEssentialQuizProvider with ChangeNotifier {
  List<QuizQuestion> _quizzes = [];
  bool _isLoading = false;

  List<QuizQuestion> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final MotorcycleEssentialDocumentQuizRepo _alertRepo = MotorcycleEssentialDocumentQuizRepo();

  Future<void> fetchQuizzes() async {
    _isLoading = true;
    notifyListeners();

    _quizzes = await _alertRepo.getQuizModels();

    _isLoading = false;
    notifyListeners();
  }

  Map<String, int> _categoryQuestionIndices = {};

  int getCurrentQuestionIndex(String category) {
    return _categoryQuestionIndices[category] ?? 0;
  }

  Future<void> loadLastQuestionIndex(String category) async {
    final prefs = await SharedPreferences.getInstance();
    _categoryQuestionIndices[category] = prefs.getInt('mlastQuestionIndex_$category') ?? 0;
    notifyListeners();
  }

  Future<void> saveLastQuestionIndex(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('mlastQuestionIndex_$category', _categoryQuestionIndices[category] ?? 0);
  }

  void updateQuestionIndex(String category, int index) {
    _categoryQuestionIndices[category] = index;
    notifyListeners();
  }
// get list of correct answer to shared preferences
  Future <List<String>> getCorrectAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('essentialcorrectAnswers') ?? [];
  }

//get list of wrong answer to shared preferences
  Future <List<String>> getWrongAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('essentialwrongAnswers') ?? [];
  }
// get category type to shared preferences
   Future <String> getCategory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('essentialcategory') ?? '';
   }

// get total question  index to shared preferences
  Future <int> getTotalQuestionIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('essentialTotalQuestionIndex') ?? 0;
  }

// get currentQuestionIndex to shared preferences
   Future <int> getCurrentQuestionIndex1() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('essentialCurrentQuestionIndex') ?? 0;
   }

// add currentQuestionIndex to shared preferences
   Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('essentialCurrentQuestionIndex', currentQuestionIndex);
   }


// add total question  index to shared preferences
   Future<void> saveCurrentQuestionIndex1(int currentQuestionIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('essentialCurrentQuestionIndex', currentQuestionIndex);

   }

// add category type to shared preferences
   Future <void> saveCategory(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('essentialcategory', category);
   }

//add list of wrong answer to shared preferences
   Future <void> saveWrongAnswers( List<String> wrongAnswers) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('essentialwrongAnswers', wrongAnswers);
   }

// add list of correct answer to shared preferences
 Future <void> saveCorrectAnswers( List<String> correctAnswers) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('essentialcorrectAnswers', correctAnswers);

 }
}
