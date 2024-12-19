import 'package:flutter/material.dart';
import '../model/hazard_quiz.dart';
import '../repo/hazard_quiz_repo.dart';

class HazardQuizProvider extends ChangeNotifier {
  final HazardQuizRepository _repository = HazardQuizRepository();
  List<HazardQuiz> _quizzes = [];
  HazardQuiz? _selectedQuiz;
  bool _isLoading = false;
  String _errorMessage = '';

  List<HazardQuiz> get quizzes => _quizzes;
  HazardQuiz? get selectedQuiz => _selectedQuiz;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  /// Fetch all quizzes from the repository.
  Future<void> fetchAllQuizzes(String collectionName) async {
    _isLoading = true;
    notifyListeners();

    try {
      _quizzes = await _repository.fetchAllQuizzes(collectionName);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch quizzes: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch a single quiz by document ID.
  Future<void> fetchQuiz(String collectionName, String docId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _selectedQuiz = await _repository.fetchQuiz(collectionName, docId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch quiz: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Add a new quiz.
  Future<void> addQuiz(String collectionName, HazardQuiz quiz) async {
    _isLoading = true;
    notifyListeners();

    try {
      bool success = await _repository.addQuiz(collectionName, quiz);
      if (success) {
        _quizzes.add(quiz);
        _errorMessage = '';
      } else {
        _errorMessage = 'Failed to add quiz.';
      }
    } catch (e) {
      _errorMessage = 'Error adding quiz: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Update an existing quiz.
  // Future<void> updateQuiz(String collectionName, String docId, HazardQuiz quiz) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   try {
  //     bool success = await _repository.updateQuiz(collectionName, docId, quiz);
  //     if (success) {
  //       int index = _quizzes.indexWhere((q) => q.id == docId); // Assuming HazardQuiz has an id property
  //       if (index != -1) {
  //         _quizzes[index] = quiz; // Update the quiz in the list
  //       }
  //       _errorMessage = '';
  //     } else {
  //       _errorMessage = 'Failed to update quiz.';
  //     }
  //   } catch (e) {
  //     _errorMessage = 'Error updating quiz: $e';
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  /// Delete a quiz.
  // Future<void> deleteQuiz(String collectionName, String docId) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   try {
  //     bool success = await _repository.deleteQuiz(collectionName, docId);
  //     if (success) {
  //       _quizzes.removeWhere((quiz) => quiz.id == docId); // Assuming HazardQuiz has an id property
  //       _errorMessage = '';
  //     } else {
  //       _errorMessage = 'Failed to delete quiz.';
  //     }
  //   } catch (e) {
  //     _errorMessage = 'Error deleting quiz: $e';
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}