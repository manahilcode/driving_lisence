import 'package:flutter/material.dart';

import '../model/discusstion_practice_model.dart';
import '../repo/discuss_practice_repo.dart'; // Replace with the correct path

class DiscussionPracticeProviderVulnerable with ChangeNotifier {
  final DiscussionPracticeRepositoryVal _repository;
  DiscussionPracticeVal? _data;
  bool _isLoading = false;
  String? _errorMessage;

  DiscussionPracticeVal? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  DiscussionPracticeProviderVulnerable(this._repository);

  // Fetch data from the repository
  Future<void> fetchDiscussionPracticeData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchDiscussionPracticeData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
