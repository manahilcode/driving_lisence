import 'package:flutter/material.dart';

import '../model/learner_drivers_model.dart';
import '../repo/learner_drivers_repo.dart';

class HighwayCodeLearnerDriversProvider extends ChangeNotifier {
  HighwayCodeLearnerDrivers? _learnerDriverInfo;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayCodeLearnerDrivers? get learnerDriverInfo => _learnerDriverInfo;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final HighwayCodeLearnerDriversRepository _repository =
  HighwayCodeLearnerDriversRepository();

  // Method to fetch learner driver information
  Future<void> fetchLearnerDriverInfo() async {
    _isLoading = true;
    notifyListeners();

    try {
      _learnerDriverInfo = await _repository.fetchLearnerDriverInfo();
      if (_learnerDriverInfo == null) {
        _errorMessage = "No data found";
      }
    } catch (e) {
      _errorMessage = "Error: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
