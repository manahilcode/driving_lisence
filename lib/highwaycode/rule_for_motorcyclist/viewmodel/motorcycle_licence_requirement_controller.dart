import 'package:flutter/material.dart';

import '../model/motorcycle_licence_requirement_model.dart';
import '../repo/motorcycle_licence_requirement_repo.dart';

class MotorcycleLicenceRequirements33Provider extends ChangeNotifier {
  MotorcycleLicenceRequirements33? _motorcycleLicenceRequirements33;
  bool _isLoading = false;
  String _errorMessage = '';

  MotorcycleLicenceRequirements33? get motorcycleLicenceRequirements33 => _motorcycleLicenceRequirements33;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final MotorcycleLicenceRequirements33Repository _repository =
  MotorcycleLicenceRequirements33Repository();

  // Method to fetch motorcycle licence requirements
  Future<void> fetchMotorcycleLicenceRequirements33() async {
    _isLoading = true;
    notifyListeners();

    try {
      _motorcycleLicenceRequirements33 = await _repository.fetchMotorcycleLicenceRequirements33();
      if (_motorcycleLicenceRequirements33 == null) {
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
