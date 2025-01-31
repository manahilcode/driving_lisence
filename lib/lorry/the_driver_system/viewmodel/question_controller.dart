import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';
import '../repo/question_repo.dart';

class LorryTheDriverSystemProvider with ChangeNotifier {
  final LorryTheDriverSystemRepository repository;
  List<LorryModel> _lorryModels = [];
  bool _isLoading = false;

  LorryTheDriverSystemProvider({required this.repository});

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
    await preferences.setInt('theDriverSystemLorryCurrentIndex', currentIndex);
  }

  Future<int> getCurrentIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('theDriverSystemLorryCurrentIndex') ?? 0;
  }

// add currentQuestionIndex to shared preferences
 Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('theDriverSystemLorryCurrentQuestionIndex', currentQuestionIndex);
 }
// add total question  index to shared preferences
 Future<void> saveTotalQuestion(int totalQuestion) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('theDriverSystemLorryTotalQuestion', totalQuestion);
 }
// add category type to shared preferences
  Future<void> saveCategory(String category) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('theDriverSystemLorryCategory', category);
  }
//add list of wrong answer to shared preferences
  Future<void> saveWrongAnswer(List<String> wrongAnswer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('theDriverSystemLorryWrongAnswer', wrongAnswer);
  }
// add list of correct answer to shared preferences
  Future<void> saveCorrectAnswer(List<String> correctAnswer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('theDriverSystemLorryCorrectAnswer', correctAnswer);
  }
// write get shared pref of all functions
// get currentQuestionIndex to shared preferences
 Future<int> getCurrentQuestionIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('theDriverSystemLorryCurrentQuestionIndex') ?? 0;
 }
// get total question  index to shared preferences
 Future<int> getTotalQuestion() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('theDriverSystemLorryTotalQuestion') ?? 0;
 }
// get category type to shared preferences
  Future<String> getCategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('theDriverSystemLorryCategory') ?? '';
  }
//get list of wrong answer to shared preferences
  Future<List<String>> getWrongAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('theDriverSystemLorryWrongAnswer') ?? [];
  }
// get list of correct answer to shared preferences
  Future<List<String>> getCorrectAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('theDriverSystemLorryCorrectAnswer') ?? [];
  }
}
