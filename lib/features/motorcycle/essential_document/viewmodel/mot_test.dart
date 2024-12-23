import 'package:flutter/material.dart';

import '../model/mot_test.dart';
import '../repo/mot_test.dart';

class MotTestDetailsNotifier extends ChangeNotifier {
  final MotTestDetailsRepository _repository;

  MotTestDetailsNotifier(this._repository);

  // State variables
  MotTestDetails? _details;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  MotTestDetails? get details => _details;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Method to fetch data
  Future<void> fetchMotTestDetails(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _details = await _repository.fetchMotTestDetails(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
