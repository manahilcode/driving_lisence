import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';
import '../repo/question_repo.dart';

class LorryDriverHoursRestProvider with ChangeNotifier {
  final LorryDriverHourRestPeroidRepository repository;
  List<LorryModel> _lorryModels = [];
  bool _isLoading = false;

  LorryDriverHoursRestProvider({required this.repository});

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
    await preferences.setInt('driverhoursLorryCurrentIndex', currentIndex);
  }

  Future<int> getCurrentIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('driverhoursLorryCurrentIndex') ?? 0;
  }

// add currentQuestionIndex to shared preferences
  Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(
        'driverhoursLorryCurrentQuestionIndex', currentQuestionIndex);
  }

// add total question  index to shared preferences
  Future<void> saveTotalQuestionIndex(int totalQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(
        'driverhoursLorryTotalQuestionIndex', totalQuestionIndex);
  }

// add category type to shared preferences
  Future<void> saveCategory(String category) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('driverhoursLorryCategory', category);
  }

//add list of wrong answer to shared preferences
  Future<void> saveWrongAnswers(List<String> wrongAnswers) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(
        'driverhoursLorryWrongAnswers', wrongAnswers);
  }

// add list of correct answer to shared preferences
  Future<void> saveCorrectAnswers(List<String> correctAnswers) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(
        'driverhoursLorryCorrectAnswers', correctAnswers);
  }

// write get shared pref of all functions
// get currentQuestionIndex to shared preferences
 Future<int> getCurrentQuestionIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('driverhoursLorryCurrentQuestionIndex') ?? 0;
 }
// get total question  index to shared preferences
  Future<int> getTotalQuestionIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('driverhoursLorryTotalQuestionIndex') ?? 0;
  }
// get category type to shared preferences
  Future<String> getCategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('driverhoursLorryCategory') ?? '';
  }
//get list of wrong answer to shared preferences
  Future<List<String>> getWrongAnswers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('driverhoursLorryWrongAnswers') ?? [];
  }
// get list of correct answer to shared preferences
  Future<List<String>> getCorrectAnswers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('driverhoursLorryCorrectAnswers') ?? [];
  }
}
