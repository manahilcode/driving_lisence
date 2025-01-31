import 'package:flutter/material.dart';

import '../model/learner_drivers_model.dart';
import '../repo/learner_driver_repo.dart';

class HighwayLearnerDriverProvider with ChangeNotifier {
  final HighwayLearnerDriverRepository _repository = HighwayLearnerDriverRepository();
  HighwayLearnerDriver? _documents;
  bool _isLoading = true;
  String _error = '';

  HighwayLearnerDriver? get documents => _documents;
  bool get isLoading => _isLoading;
  String get error => _error;

  HighwayLearnerDriverProvider() {
    fetchLearnerDriverDocuments();
  }

  Future<void> fetchLearnerDriverDocuments() async {
    _isLoading = true;
    notifyListeners();

    try {
      _documents = await _repository.getLearnerDriverDocuments();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load learner driver documents';
      _isLoading = false;
    }

    notifyListeners();
  }
}
