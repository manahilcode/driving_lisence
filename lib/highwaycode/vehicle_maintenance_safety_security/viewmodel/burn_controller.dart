import 'package:flutter/material.dart';

import '../model/burn_model.dart';
import '../repo/burn_repo.dart';

class HighwayBurnsProvider with ChangeNotifier {
  final HighwayBurnsRepository _repository = HighwayBurnsRepository();
  HighwayBurns? _document;
  bool _isLoading = true;
  String _error = '';

  HighwayBurns? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  HighwayBurnsProvider() {
    fetchBurnsDocument();
  }

  Future<void> fetchBurnsDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getBurnsDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Burns document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
