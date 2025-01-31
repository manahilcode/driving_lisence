import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';
import '../repo/question_repo.dart';

class LorryOtherRoadUsersProvider with ChangeNotifier {
  final LorryOtherRoadUserRepository repository;
  List<LorryModel> _lorryModels = [];
  bool _isLoading = false;

  LorryOtherRoadUsersProvider({required this.repository});

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
    await preferences.setInt('otherroaduserLorryCurrentIndex', currentIndex);
  }

  Future<int> getCurrentIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('otherroaduserLorryCurrentIndex') ?? 0;
  }

// add currentQuestionIndex to shared preferences
 Future<void> saveCurrentQuestionIndex(int currentQuestionIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('otherroaduserLorryCurrentQuestionIndex', currentQuestionIndex);
 }
// add total question  index to shared preferences
 Future<void> saveTotalQuestion(int totalQuestion) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('otherroaduserLorryTotalQuestion', totalQuestion);
 }

// add category type to shared preferences
 Future<void> saveCategoryType(String categoryType) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('otherroaduserLorryCategoryType', categoryType);
 }
//add list of wrong answer to shared preferences
  Future<void> saveWrongAnswer(List<String> wrongAnswer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('otherroaduserLorryWrongAnswer', wrongAnswer);
  }
// add list of correct answer to shared preferences
  Future<void> saveCorrectAnswer(List<String> correctAnswer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('otherroaduserLorryCorrectAnswer', correctAnswer);
  }

// write get shared pref of all functions
// get currentQuestionIndex to shared preferences
  Future <int> getCurrentQuestionIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('otherroaduserLorryCurrentQuestionIndex') ?? 0;
  }
// get total question  index to shared preferences
  Future <int> getTotalQuestion() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('otherroaduserLorryTotalQuestion') ?? 0;
  }
// get category type to shared preferences
  Future <String> getCategoryType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('otherroaduserLorryCategoryType') ?? '';
  }
//get list of wrong answer to shared preferences
  Future <List<String>> getWrongAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('otherroaduserLorryWrongAnswer') ?? [];
  }
// get list of correct answer to shared preferences
  Future <List<String>> getCorrectAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('otherroaduserLorryCorrectAnswer') ?? [];
  }
}
