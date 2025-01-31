import 'package:flutter/material.dart';

import '../model/motorcycle_licence_requirement1_model.dart';
import '../repo/motorcycle_licence_requirement1_repo.dart';

class MotorcycleLicenceRequirements22Provider extends ChangeNotifier {
  MotorcycleLicenceRequirements22? _motorcycleLicenceRequirements22;
  bool _isLoading = false;
  String _errorMessage = '';

  MotorcycleLicenceRequirements22? get motorcycleLicenceRequirements22 => _motorcycleLicenceRequirements22;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final MotorcycleLicenceRequirements22Repository _repository =
  MotorcycleLicenceRequirements22Repository();

  // Method to fetch motorcycle licence requirements
  Future<void> fetchMotorcycleLicenceRequirements22() async {
    _isLoading = true;
    notifyListeners();

    try {
      _motorcycleLicenceRequirements22 = await _repository.fetchMotorcycleLicenceRequirements22();
      if (_motorcycleLicenceRequirements22 == null) {
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
