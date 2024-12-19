import 'package:flutter/material.dart';

import '../model/hazard_managment_model.dart';
import '../repo/hazard_managment_repo.dart';

class HazardManagementProvider extends ChangeNotifier {
  final HazardManagementRepository _repository = HazardManagementRepository();
  HazardManagement? _hazard;
  bool _isLoading = false;
  String _errorMessage = '';

  HazardManagement? get hazard => _hazard;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Method to fetch a hazard from the repository
  Future<void> fetchHazard(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _hazard = await _repository.fetchHazard(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch hazard: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}