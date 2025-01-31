import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../allertness/repo/repo.dart';
import '../../Alerness_quiz/model/alernessmodel.dart';
import '../repo/vulnerable_road_repo.dart';


class MotorcycleVulnerableQuizProvider with ChangeNotifier {
  List<QuizQuestion> _quizzes = [];
  bool _isLoading = false;

  List<QuizQuestion> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final MotorcycleVulnerableQuizRepo _alertRepo = MotorcycleVulnerableQuizRepo();

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
  Future <List<String>?> getCorrectAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('vulnerablecorrectAnswer');
  }


//get list of wrong answer to shared preferences
  Future <List<String>?> getWrongAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('vulnerablewrongAnswer');
  }

// get category type to shared preferences
  Future<String?> getCategoryType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('vulnerablecategoryType');
  }

// get total question  index to shared preferences
  Future <int?> getTotalQuestionIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('vulnerableTotalQuestionIndex');
  }

// get currentQuestionIndex to shared preferences
   Future <int?> getCurrentQuestionIndex1() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('vulnerableCurrentQuestionIndex');
   }

// add currentQuestionIndex to shared preferences
  Future <void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('vulnerableCurrentQuestionIndex', currentQuestionIndex);
  }

// add total question  index to shared preferences
  Future <void> saveTotalQuestionIndex(int totalQuestionIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('vulnerableTotalQuestionIndex', totalQuestionIndex);
  }

// add category type to shared preferences
  Future<void> saveCategoryType(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('vulnerablecategoryType', category);
  }

//add list of wrong answer to shared preferences
  Future <void> saveWrongAnswer(List<String> wrongAnswer) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('vulnerablewrongAnswer', wrongAnswer);

  }

// add list of correct answer to shared preferences
 Future <void> saveCorrectAnswer(List<String> correctAnswer) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('vulnerablecorrectAnswer', correctAnswer);
  }
 }

