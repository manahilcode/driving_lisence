import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../allertness/repo/repo.dart';
import '../../Alerness_quiz/model/alernessmodel.dart';
import '../repo/hazard_repo.dart';


class MotorcycleHazardAwarenessQuizProvider with ChangeNotifier {
  List<QuizQuestion> _quizzes = [];
  bool _isLoading = false;

  List<QuizQuestion> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final MotorcycleHazardAwarenessQuizRepo _alertRepo = MotorcycleHazardAwarenessQuizRepo();

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
   Future<List<String>> getCorrectAnswerList() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getStringList('motorcycleHazardAwarenessCorrectAnswerList') ?? [];
   }

//get list of wrong answer to shared preferences
   Future<List<String>> getWrongAnswerList() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getStringList('motorcycleHazardAwarenessWrongAnswerList') ?? [];
   }

// get category type to shared preferences
   Future<String> getCategoryType() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString('motorcycleHazardAwarenessCategoryType') ?? '';
   }

// get total question  index to shared preferences
   Future<int> getTotalQuestionIndex() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getInt('motorcycleHazardAwarenessTotalQuestionIndex') ?? 0;
   }

// get currentQuestionIndex to shared preferences
   Future<int> getCurrentQuestionIndex1(String category) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getInt('motorcycleHazardAwarenessCurrentQuestionIndex') ?? 0;
   }

// add currentQuestionIndex to shared preferences
   Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.setInt('motorcycleHazardAwarenessCurrentQuestionIndex', currentQuestionIndex);
   }

// add total question  index to shared preferences
   Future<void> saveTotalQuestionIndex(int totalQuestionIndex) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.setInt('motorcycleHazardAwarenessTotalQuestionIndex', totalQuestionIndex);
   }

// add category type to shared preferences
   Future<void> saveCategoryType(String categoryType) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.setString('motorcycleHazardAwarenessCategoryType', categoryType);
   }

//add list of wrong answer to shared preferences
   Future<void> saveWrongAnswerList(List<String> wrongAnswerList) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.setStringList('motorcycleHazardAwarenessWrongAnswerList', wrongAnswerList);
   }

// add list of correct answer to shared preferences
   Future<void> saveCorrectAnswerList(List<String> correctAnswerList) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.setStringList('motorcycleHazardAwarenessCorrectAnswerList', correctAnswerList);

   }
}
