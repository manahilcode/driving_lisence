import 'package:flutter/material.dart';

import '../model/you_and_your_bicycle_model.dart';
import '../repo/you_and_your_bicycle_repo.dart';

class YouAndYourBicycleProvider with ChangeNotifier {
  final YouAndYourBicycleRepository _repository = YouAndYourBicycleRepository();

  YouAndYourBicycle? _data;
  bool _isLoading = false;
  String _errorMessage = '';

  YouAndYourBicycle? get data => _data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore
  Future<void> fetchBicycleData(String documentId) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _data = await _repository.fetchData(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

