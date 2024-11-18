import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../all_categories_quiz/model/model.dart';
import '../repo/repo.dart';


class AllCategoriesQuizProvider extends ChangeNotifier {
  final AllCategory _allCategory = AllCategory();
  List<QuizModel> _quizzes = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<QuizModel> get quizzes => _quizzes;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Function to fetch all quizzes
  Future<void> fetchQuizzes() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners(); // Notify listeners that loading has started

    try {
      _quizzes = await _allCategory.getAllQuizModels();
    } catch (e) {
      _errorMessage = 'Failed to load quizzes: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners that loading has ended
    }
  }
  Map<String, int> _categoryQuestionIndices = {};

  int getCurrentQuestionIndex(String category) {
    return _categoryQuestionIndices[category] ?? 0;
  }

  Future<void> loadLastQuestionIndex(String category) async {
    final prefs = await SharedPreferences.getInstance();
    _categoryQuestionIndices[category] = prefs.getInt('lastQuestionIndex_$category') ?? 0;
    notifyListeners();
  }

  Future<void> saveLastQuestionIndex(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastQuestionIndex_$category', _categoryQuestionIndices[category] ?? 0);
  }

  void updateQuestionIndex(String category, int index) {
    _categoryQuestionIndices[category] = index;
    notifyListeners();
  }
}