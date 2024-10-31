import 'package:flutter/material.dart';

import '../../../allertness/repo/repo.dart';
import '../model/model.dart';
import '../repo/repo.dart';

class SafetyVehicleQuizProvider with ChangeNotifier {
  List<QuizModel> _quizzes = [];
  bool _isLoading = false;

  List<QuizModel> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final SafetyVehicleQuizRepo _alertRepo = SafetyVehicleQuizRepo();

  Future<void> fetchQuizzes() async {
    _isLoading = true;
    notifyListeners();

    _quizzes = await _alertRepo.getQuizModels();

    _isLoading = false;
    notifyListeners();
  }
}
