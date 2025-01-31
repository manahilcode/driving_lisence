
import 'package:flutter/material.dart';

import '../model/safety_code_for_driver_model.dart';
import '../repo/safety_code_for_driver_repo.dart';

class SafetyCodeProvider with ChangeNotifier {
  final SafetyCodeRepository _repository = SafetyCodeRepository();
  SafetyCodeForNewDrivers? _document;
  bool _isLoading = true;
  String _error = '';

  SafetyCodeForNewDrivers? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  SafetyCodeProvider() {
    fetchSafetyCodeDocument();
  }

  Future<void> fetchSafetyCodeDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getSafetyCodeDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Safety Code for New Drivers document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
