import 'package:flutter/material.dart';

import '../model/model.dart';
import '../repo/repo.dart';

class HazardAwarenessQuizProvider with ChangeNotifier {
  List<QuizModel> _quizzes = [];
  bool _isLoading = false;

  List<QuizModel> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final HazardAwarenessQuizRepo _alertRepo = HazardAwarenessQuizRepo();

  Future<void> fetchQuizzes() async {
    _isLoading = true;
    notifyListeners();

    _quizzes = await _alertRepo.getQuizModels();

    _isLoading = false;
    notifyListeners();
  }
}
