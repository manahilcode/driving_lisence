import 'package:flutter/material.dart';

import '../model/hazardoius_load.dart';
import '../repo/hazardoius_load.dart'; // Replace with the correct path

class HazardousLoadProvider with ChangeNotifier {
  final HazardousLoadRepository _repository;
  HazardousLoad? _data;
  bool _isLoading = false;
  String? _errorMessage;

  HazardousLoad? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  HazardousLoadProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchHazardousLoadData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchHazardousLoadData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
