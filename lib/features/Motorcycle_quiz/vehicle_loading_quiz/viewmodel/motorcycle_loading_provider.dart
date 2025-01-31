import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../allertness/repo/repo.dart';
import '../../Alerness_quiz/model/alernessmodel.dart';
import '../repo/motorcycle_loading_repo.dart';


class MotorcycleVehicleLoadingQuizProvider with ChangeNotifier {
  List<QuizQuestion> _quizzes = [];
  bool _isLoading = false;

  List<QuizQuestion> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final MotorcycleVehicleLoadingQuizRepo _alertRepo = MotorcycleVehicleLoadingQuizRepo();

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
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('vehicleLoadingcorrectAnswer') ?? [];
  }

//get list of wrong answer to shared preferences
  Future <List<String>> getWrongAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('vehicleLoadingwrongAnswer') ?? [];
  }

// get category type to shared preferences
  Future<String> getCategoryType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('vehicleLoadingcategoryType') ?? '';
  }

// get total question  index to shared preferences
  Future <int> getTotalQuestionIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('vehicleLoadingTotalQuestionIndex') ?? 0;
  }


// get currentQuestionIndex to shared preferences
  Future<String> getCurrentQuestionIndex1() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('vehicleLoadingcategory') ?? '';
  }

// add currentQuestionIndex to shared preferences
  Future<void> saveCurrentQuestionIndex(String category) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('vehicleLoadingcategory','$category');
  }
// add total question  index to shared preferences
  Future <void> saveTotalQuestionIndex(int totalQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('vehicleLoadingTotalQuestionIndex', totalQuestionIndex);
  }

// add category type to shared preferences
  Future<void> saveCategoryType(String categoryType) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('vehicleLoadingcategoryType', categoryType);
  }

//add list of wrong answer to shared preferences
  Future<void> saveWrongAnswer(List<String> wrongAnswer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('vehicleLoadingwrongAnswer', wrongAnswer);
  }

// add list of correct answer to shared preferences
 Future<void> saveCorrectAnswer(List<String> correctAnswer) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setStringList('vehicleLoadingcorrectAnswer', correctAnswer);
 }
}
