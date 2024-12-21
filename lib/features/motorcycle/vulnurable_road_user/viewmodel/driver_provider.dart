import 'package:flutter/material.dart';

import '../model/drivers_vulnurable_model.dart';
import '../repo/driver_repo.dart'; // Replace with correct path

class DriverProvider with ChangeNotifier {
  final DriverRepository _repository;
  Driver? _data;
  bool _isLoading = false;
  String? _errorMessage;

  Driver? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  DriverProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchDriverData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchDriverData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
