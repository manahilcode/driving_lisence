import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';
import '../repo/question_repo.dart';

class LorryVehicleWeightDimensionProvider with ChangeNotifier {
  final LorryVehicleWeightDimensionRepository repository;
  List<LorryModel> _lorryModels = [];
  bool _isLoading = false;

  LorryVehicleWeightDimensionProvider({required this.repository});

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
    await preferences.setInt('vehicleWeightDimensionLorryCurrentIndex', currentIndex);
  }

  Future<int> getCurrentIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('vehicleWeightDimensionLorryCurrentIndex') ?? 0;
  }

// add currentQuestionIndex to shared preferences
 Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('vehicleWeightDimensionLorryCurrentQuestionIndex', currentQuestionIndex);
 }
// add total question  index to shared preferences
 Future<void> saveTotalQuestionIndex(int totalQuestionIndex) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.setInt('vehicleWeightDimensionLorryTotalQuestionIndex', totalQuestionIndex);
 }
// add category type to shared preferences
 Future<void> saveCategoryType(String categoryType) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.setString('vehicleWeightDimensionLorryCategoryType', categoryType);
 }
//add list of wrong answer to shared preferences
 Future<void> saveWrongAnswerList(List<String> wrongAnswerList) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.setStringList('vehicleWeightDimensionLorryWrongAnswerList', wrongAnswerList);
 }
// add list of correct answer to shared preferences
 Future<void> saveCorrectAnswerList(List<String> correctAnswerList) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.setStringList('vehicleWeightDimensionLorryCorrectAnswerList', correctAnswerList);
 }

 // write get shared pref of all functions
// get currentQuestionIndex to shared preferences
  Future<int> getCurrentQuestionIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('vehicleWeightDimensionLorryCurrentQuestionIndex') ?? 0;
  }
// get total question  index to shared preferences
  Future<int> getTotalQuestionIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('vehicleWeightDimensionLorryTotalQuestionIndex') ?? 0;
  }
// get category type to shared preferences
  Future<String> getCategoryType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('vehicleWeightDimensionLorryCategoryType') ?? '';
  }
//get list of wrong answer to shared preferences
  Future<List<String>> getWrongAnswerList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('vehicleWeightDimensionLorryWrongAnswerList') ?? [];
  }
// get list of correct answer to shared preferences
  Future<List<String>> getCorrectAnswerList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('vehicleWeightDimensionLorryCorrectAnswerList') ?? [];
  }



}
