import 'package:flutter/material.dart';
import '../model/lane_and_junction.dart';
import '../repo/lane_and_junction.dart';

class LaneAndJunctionProvider extends ChangeNotifier {
  final QuestionRepositoryLane _repository = QuestionRepositoryLane();
  LaneAndJunction? _questions;
  bool _isLoading = false;
  String? _errorMessage;

   LaneAndJunction get questions => _questions!;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadQuestions(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _questions = await _repository.fetchQuestions(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
