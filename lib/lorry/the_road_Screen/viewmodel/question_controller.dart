import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';
import '../repo/question_repo.dart';

class LorryTheRoadScreenProvider with ChangeNotifier {
  final LorryTheRoadScreenRepository repository;
  List<LorryModel> _lorryModels = [];
  bool _isLoading = false;

  LorryTheRoadScreenProvider({required this.repository});

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
    await preferences.setInt('theroadLorryCurrentIndex', currentIndex);
  }

  Future<int> getCurrentIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('theroadLorryCurrentIndex') ?? 0;
  }
// add currentQuestionIndex to shared preferences
 Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('theroadLorryCurrentQuestionIndex', currentQuestionIndex);
 }
// add total question  index to shared preferences
 Future<void> saveTotalQuestion(int totalQuestion) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('theroadLorryTotalQuestion', totalQuestion);
 }
// add category type to shared preferences
 Future<void> saveCategoryType(String categoryType) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('theroadLorryCategoryType', categoryType);
 }
//add list of wrong answer to shared preferences
 Future<void> saveWrongAnswer(List<String> wrongAnswer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('theroadLorryWrongAnswer', wrongAnswer);
 }
// add list of correct answer to shared preferences
 Future<void> saveCorrectAnswer(List<String> correctAnswer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('theroadLorryCorrectAnswer', correctAnswer);
 }

// write get shared pref of all functions
// get currentQuestionIndex to shared preferences
  Future <int> getCurrentQuestionIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('theroadLorryCurrentQuestionIndex') ?? 0;
  }
// get total question  index to shared preferences
  Future <int> getTotalQuestion() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('theroadLorryTotalQuestion') ?? 0;
  }
// get category type to shared preferences
  Future <String> getCategoryType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('theroadLorryCategoryType') ?? '';
  }
//get list of wrong answer to shared preferences
  Future <List<String>> getWrongAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('theroadLorryWrongAnswer') ?? [];
  }
// get list of correct answer to shared preferences
  Future <List<String>> getCorrectAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('theroadLorryCorrectAnswer') ?? [];
  }
}
