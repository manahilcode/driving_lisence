import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../allertness/repo/repo.dart';
import '../model/alernessmodel.dart';
import '../repo/alernessrepo.dart';


class MotorcycleAllertQuizProvider with ChangeNotifier {
  List<QuizQuestion> _quizzes = [];
  bool _isLoading = false;

  List<QuizQuestion> get quizzes => _quizzes;

  bool get isLoading => _isLoading;

  final MotorcycleAlertQuizRepo _alertRepo = MotorcycleAlertQuizRepo();

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
    _categoryQuestionIndices[category] =
        prefs.getInt('mlastQuestionIndex_$category') ?? 0;
    notifyListeners();
  }

  Future<void> saveLastQuestionIndex(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('mlastQuestionIndex_$category',
        _categoryQuestionIndices[category] ?? 0);
  }

  void updateQuestionIndex(String category, int index) {
    _categoryQuestionIndices[category] = index;
    notifyListeners();
  }

// get list of correct answer to shared preferences
  Future<List<String>> getCorrectAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('AllertnessCorrectAnswer') ?? [];
  }

//get list of wrong answer to shared preferences
  Future<List<String>> getWrongAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('AllertnesswrongAnswer') ?? [];
  }

// get category type to shared preferences
  Future<String> getCategory(String category) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('AllertnessCategory') ?? '';
  }

// get total question  index to shared preferences
  Future<int> getTotalQuestionIndex(String category) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('AllertnessTotalQuestionIndex') ?? 0;
  }

// get currentQuestionIndex to shared preferences
  Future<int> getCurrentQuestionIndex1(String category) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('AllertnessCurrentQuestionIndex') ?? 0;
  }

// add currentQuestionIndex to shared preferences
  Future <void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(
        'AllertnessCurrentQuestionIndex', currentQuestionIndex);
  }

// add total question  index to shared preferences
  Future <void> saveTotalQuestionIndex(int totalQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(
        'AllertnessTotalQuestionIndex', totalQuestionIndex);
  }

// add category type to shared preferences
  Future <void> saveCategory(String category) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('AllertnessCategory', category);
  }

//add list of wrong answer to shared preferences
  Future <void> saveWrongAnswer(List<String> wrongAnswer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('AllertnesswrongAnswer', wrongAnswer);
  }

// add list of correct answer to shared preferences

  Future<void> saveCorrectAnswer(List<String> correctAnswer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('AllertnesscorrectAnswer', correctAnswer);
  }
}
