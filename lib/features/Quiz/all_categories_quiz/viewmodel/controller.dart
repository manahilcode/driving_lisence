import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}