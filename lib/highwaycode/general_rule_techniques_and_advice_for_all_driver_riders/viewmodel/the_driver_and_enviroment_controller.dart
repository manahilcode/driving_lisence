// Provider class for TheDriverAndEnvironment
import 'package:flutter/material.dart';

import '../model/the_driver_and_enviroment_model.dart';
import '../repo/the_driver_and_enviroment_repo.dart';

class TheDriverAndEnvironmentProvider extends ChangeNotifier {
  final TheDriverAndEnvironmentRepository _repository = TheDriverAndEnvironmentRepository();

  TheDriverAndEnvironment? _theDriverAndEnvironment;
  TheDriverAndEnvironment? get theDriverAndEnvironment => _theDriverAndEnvironment;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchTheDriverAndEnvironment(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _theDriverAndEnvironment = await _repository.fetchTheDriverAndEnvironmentData(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}