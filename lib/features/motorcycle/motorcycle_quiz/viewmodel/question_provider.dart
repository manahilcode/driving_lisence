import 'package:flutter/material.dart';

import '../model/question_model.dart';
import '../repo/questionRepo.dart';

class CrossingTypeNotifier extends ChangeNotifier {
  final QuestionRepoMotorcycle repository;

  MotorcycleQuestionModel? _crossingType;
  bool _isLoading = false;
  String? _errorMessage;

  MotorcycleQuestionModel? get crossingType => _crossingType;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  CrossingTypeNotifier({required this.repository});

  Future<void> loadCrossingType(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _crossingType = await repository.fetchCrossingType(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
