import 'package:flutter/material.dart';

import '../model/insurance.dart';
import '../repo/insurance.dart';

class InsuranceDetailsNotifier extends ChangeNotifier {
  final InsuranceDetailsRepository _repository;

  InsuranceDetailsNotifier(this._repository);

  // State variables
  InsuranceDetails? _details;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  InsuranceDetails? get details => _details;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Method to fetch data
  Future<void> fetchInsuranceDetails(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _details = await _repository.fetchInsuranceDetails(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
