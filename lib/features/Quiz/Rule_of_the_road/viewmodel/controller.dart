import 'package:flutter/material.dart';

import '../../../allertness/repo/repo.dart';
import '../model/model.dart';
import '../repo/repo.dart';


class RuleOfRoadQuizProvider with ChangeNotifier {
  List<QuizModel> _quizzes = [];
  bool _isLoading = false;

  List<QuizModel> get quizzes => _quizzes;
  bool get isLoading => _isLoading;

  final RuleOfRoadQuizRepo _alertRepo = RuleOfRoadQuizRepo();

  Future<void> fetchQuizzes() async {
    _isLoading = true;
    notifyListeners();

    _quizzes = await _alertRepo.getQuizModels();

    _isLoading = false;
    notifyListeners();
  }
}