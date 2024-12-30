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
}
