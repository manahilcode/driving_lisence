import 'package:flutter/material.dart';

import '../model/cyclist_vulnurable_user.dart';
import '../repo/cyclist_repo.dart'; // Replace with correct path

class CyclistProvider with ChangeNotifier {
  final CyclistRepository _repository;
  Cyclist? _data;
  bool _isLoading = false;
  String? _errorMessage;

  Cyclist? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  CyclistProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchCyclistData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchCyclistData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
