import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../allertness/repo/repo.dart';
import '../../Alerness_quiz/model/alernessmodel.dart';
import '../repo/rule_of_road_repo.dart';


class MotorcycleRuleOfRoadQuizProvider with ChangeNotifier {
  List<QuizQuestion> _quizzes = [];
  bool _isLoading = false;

  List<QuizQuestion> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final MotorcycleRuleOfRoadQuizRepo _alertRepo = MotorcycleRuleOfRoadQuizRepo();

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

  Future<List<String>> getCorrectAnswers() async => (await SharedPreferences.getInstance()).getStringList('MotorcycleRuleOfRoadCorrectAnswers') ?? [];

//get list of wrong answer to shared preferences

  Future<List<String>> getWrongAnswers() async => (await SharedPreferences.getInstance()).getStringList('MotorcycleRuleOfRoadWrongAnswers') ?? [];

// get category type to shared preferences
  Future<String> getCategoryType() async => (await SharedPreferences.getInstance()).getString('MotorcycleRuleOfRoadCategoryType') ?? '';

// get total question  index to shared preferences
  Future<int> getTotalQuestionIndex() async => (await SharedPreferences.getInstance()).getInt('MotorcycleRuleOfRoadTotalQuestionIndex') ?? 0;

// get currentQuestionIndex to shared preferences
  Future<int> getCurrentQuestionIndex1() async => (await SharedPreferences.getInstance()).getInt('MotorcycleRuleOfRoadCurrentQuestionIndex') ?? 0;

// add currentQuestionIndex to shared preferences
   Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('MotorcycleRuleOfRoadCurrentQuestionIndex', currentQuestionIndex);
   }

// add total question  index to shared preferences
   Future<void> saveTotalQuestionIndex(int totalQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('MotorcycleRuleOfRoadTotalQuestionIndex', totalQuestionIndex);
   }

// add category type to shared preferences
   Future<void> saveCategoryType(String categoryType) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('MotorcycleRuleOfRoadCategoryType', categoryType);
   }

//add list of wrong answer to shared preferences
  Future<void> saveWrongAnswers(List<String> wrongAnswers) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('MotorcycleRuleOfRoadWrongAnswers', wrongAnswers);
  }

// add list of correct answer to shared preferences
 Future <void> saveCorrectAnswers(List<String> correctAnswers) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setStringList('MotorcycleRuleOfRoadCorrectAnswers', correctAnswers);
 }
}
