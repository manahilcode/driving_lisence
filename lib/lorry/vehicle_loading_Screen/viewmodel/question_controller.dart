import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';
import '../repo/question_repo.dart';

class LorryVehicleLoadingProvider with ChangeNotifier {
  final LorryVehicleLooadingRepository repository;
  List<LorryModel> _lorryModels = [];
  bool _isLoading = false;

  LorryVehicleLoadingProvider({required this.repository});

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
    await preferences.setInt('vehicleLoadingLorryCurrentIndex', currentIndex);
  }

  Future<int> getCurrentIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('vehicleLoadingLorryCurrentIndex') ?? 0;
  }

// add currentQuestionIndex to shared preferences
 Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.setInt('vehicleLoadingLorryCurrentQuestionIndex', currentQuestionIndex);
 }
// add total question  index to shared preferences
 Future<void> saveTotalQuestion(int totalQuestion) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.setInt('vehicleLoadingLorryTotalQuestion', totalQuestion);
 }
// add category type to shared preferences
 Future<void> saveCategoryType(String categoryType) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.setString('vehicleLoadingLorryCategoryType', categoryType);
 }
//add list of wrong answer to shared preferences
  Future<void> saveWrongAnswers(List<String> wrongAnswers) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('vehicleLoadingLorryWrongAnswers', wrongAnswers);
  }
// add list of correct answer to shared preferences
  Future<void> saveCorrectAnswers(List<String> correctAnswers) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('vehicleLoadingLorryCorrectAnswers', correctAnswers);
  }

// write get shared pref of all functions
// get currentQuestionIndex to shared preferences
 Future <int> getCurrentQuestionIndex() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   return preferences.getInt('vehicleLoadingLorryCurrentQuestionIndex') ?? 0;
 }
// get total question  index to shared preferences
 Future <int> getTotalQuestion() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   return preferences.getInt('vehicleLoadingLorryTotalQuestion') ?? 0;
 }
// get category type to shared preferences
 Future <String> getCategoryType() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   return preferences.getString('vehicleLoadingLorryCategoryType') ?? '';
 }
//get list of wrong answer to shared preferences
 Future <List<String>> getWrongAnswers() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   return preferences.getStringList('vehicleLoadingLorryWrongAnswers') ?? [];
 }
// get list of correct answer to shared preferences
 Future <List<String>> getCorrectAnswers() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   return preferences.getStringList('vehicleLoadingLorryCorrectAnswers') ?? [];
 }
}
