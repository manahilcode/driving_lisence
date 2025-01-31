import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../allertness/repo/repo.dart';
import '../../Alerness_quiz/model/alernessmodel.dart';
import '../repo/safety_motorcycle_repo.dart';


class MotorcycleSafetyMotorcycleQuizProvider with ChangeNotifier {
  List<QuizQuestion> _quizzes = [];
  bool _isLoading = false;

  List<QuizQuestion> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final MotorcycleSafetyMotorCycleQuizRepo _alertRepo = MotorcycleSafetyMotorCycleQuizRepo();

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
   Future <List<String>> getCorrectAnswers() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getStringList('safetyMotorcycleCorrectAnswers') ?? [];
   }

//get list of wrong answer to shared preferences
   Future <List<String>> getWrongAnswers() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getStringList('safetyMotorcycleWrongAnswers') ?? [];
   }

// get category type to shared preferences
   Future <String> getCategory() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString('safetyMotorcyclecategory') ?? '';
   }

// get total question  index to shared preferences
   Future <int> getTotalQuestionIndex() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getInt('safetyMotorcycleTotalQuestionIndex') ?? 0;
   }

// get currentQuestionIndex to shared preferences
   Future <int> getCurrentQuestionIndex1() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getInt('safetyMotorcycleCurrentQuestionIndex') ?? 0;
   }

// add currentQuestionIndex to shared preferences
  Future <void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('safetyMotorcycleCurrentQuestionIndex', currentQuestionIndex);
  }

// add total question  index to shared preferences
  Future <void> saveTotalQuestionIndex(int totalQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('safetyMotorcycleTotalQuestionIndex', totalQuestionIndex);
  }

// add category type to shared preferences
   Future <void> saveCategory(String category) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.setString('safetyMotorcyclecategory', category);
   }

//add list of wrong answer to shared preferences
  Future <void> saveWrongAnswers(List<String> wrongAnswers) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('safetyMotorcycleWrongAnswers', wrongAnswers);
  }

// add list of correct answer to shared preferences
   Future <void> saveCorrectAnswers(List<String> correctAnswers) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.setStringList('safetyMotorcycleCorrectAnswers', correctAnswers);

   }
}
