// Provider class for HighwaySpeedLimits
import 'package:flutter/material.dart';

import '../model/speed_limit_model.dart';
import '../repo/speed_limit_repo.dart';

class HighwaySpeedLimitsProvider extends ChangeNotifier {
  final HighwaySpeedLimitsRepository _repository = HighwaySpeedLimitsRepository();

  HighwaySpeedLimits? _highwaySpeedLimits;
  HighwaySpeedLimits? get highwaySpeedLimits => _highwaySpeedLimits;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchHighwaySpeedLimits(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwaySpeedLimits = await _repository.fetchHighwaySpeedLimitsData(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}