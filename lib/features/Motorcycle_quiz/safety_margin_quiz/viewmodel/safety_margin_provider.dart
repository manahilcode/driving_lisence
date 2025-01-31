import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../allertness/repo/repo.dart';
import '../../Alerness_quiz/model/alernessmodel.dart';
import '../repo/safety_margin_repo.dart';


class MotorcycleSafetyMarginQuizProvider with ChangeNotifier {
  List<QuizQuestion> _quizzes = [];
  bool _isLoading = false;

  List<QuizQuestion> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final MotorcycleSafetyMarginQuizRepo _alertRepo = MotorcycleSafetyMarginQuizRepo();

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
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('safetyMarginCorrectAnswers') ?? [];
  }

//get list of wrong answer to shared preferences
  Future <List<String>> getWrongAnswers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('safetyMarginWrongAnswers') ?? [];
  }

// get category type to shared preferences
  Future <String> getCategoryType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('safetyMarginCategory') ?? '';
  }

// get total question  index to shared preferences
  Future <int> getTotalQuestionIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('safetyMarginTotalQuestionIndex') ?? 0;
  }

// get currentQuestionIndex to shared preferences
  Future <int> getCurrentQuestionIndex1(String category) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('safetyMarginCurrentQuestionIndex') ?? 0;
  }

// add currentQuestionIndex to shared preferences
  Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('safetyMarginCurrentQuestionIndex', currentQuestionIndex);
  }

// add total question  index to shared preferences
  Future <void> saveTotalQuestionIndex(int totalQuestionIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('safetyMarginTotalQuestionIndex', totalQuestionIndex);
  }

// add category type to shared preferences
  Future<void> saveCategoryType(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('safetyMarginCategory', category);
  }

//add list of wrong answer to shared preferences
  Future<void> saveWrongAnswers(List<String> wrongAnswers) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('safetyMarginWrongAnswers', wrongAnswers);
  }

// add list of correct answer to shared preferences
 Future<void> saveCorrectAnswers(List<String> correctAnswers) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('safetyMargincorrectAnswers', correctAnswers);
 }
}
