import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';
import '../repo/question_repo.dart';

class LorryAccidentHandlingProvider with ChangeNotifier {
  final LorryAccidentHandlingRepository repository;
  List<LorryModel> _lorryModels = [];
  bool _isLoading = false;

  LorryAccidentHandlingProvider({required this.repository});

  List<LorryModel> get lorryModels => _lorryModels;
  bool get isLoading => _isLoading;

  Future<void> loadLorryData() async {
    _isLoading = true;
    notifyListeners();
    _lorryModels = await repository.fetchLorryData();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveCurrentIndex(int currentIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('AccidentHandlingLorryCurrentIndex', currentIndex);
  }

  Future<int> getCurrentIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('AccidentHandlingLorryCurrentIndex') ?? 0;
  }

  Future<void> clearCurrentIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('AccidentHandlingLorryCurrentIndex');
  }

  // add list of correct answer to shared preferences
  Future<void> saveCorrectAnswers(List<String> correctAnswers) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(
        'AccidentHandlingLorryCorrectAnswers', correctAnswers);
  }

  //add list of wrong answer to shared preferences
  Future<void> saveWrongAnswers(List<String> wrongAnswers) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(
        'AccidentHandlingLorryWrongAnswers', wrongAnswers);
  }

  // add category type to shared preferences
  Future<void> saveCategory(String category) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('AccidentHandlingLorryCategory', category);
  }

  // add total question  index to shared preferences
  Future<void> saveTotalQuestion(int totalQuestion) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(
        'AccidentHandlingLorryTotalQuestion', totalQuestion);
  }

  // add currentQuestionIndex to shared preferences
  Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(
        'AccidentHandlingLorryCurrentQuestionIndex', currentQuestionIndex);
  }

// get currentQuestionIndex to shared preferences
  Future<int> getCurrentQuestionIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('AccidentHandlingLorryCurrentQuestionIndex') ?? 0;
  }

// get total question  index to shared preferences
  Future<int> getTotalQuestion() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('AccidentHandlingLorryTotalQuestion') ?? 0;
  }

// get category type to shared preferences
  Future<String> getCategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('AccidentHandlingLorryCategory') ?? '';
  }

//get list of wrong answer to shared preferences
  Future<List<String>> getWrongAnswers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('AccidentHandlingLorryWrongAnswers') ?? [];
  }

// get list of correct answer to shared preferences
  Future<List<String>> getCorrectAnswers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('AccidentHandlingLorryCorrectAnswers') ??
        [];
  }
}
