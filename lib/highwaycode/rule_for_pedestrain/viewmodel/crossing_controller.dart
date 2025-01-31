
import 'package:flutter/material.dart';

import '../model/crossing_model.dart';
import '../repo/crossing_repo.dart';

class HighwayCrossingProvider with ChangeNotifier {
  final HighwayCrossingRepository _repository = HighwayCrossingRepository();
  HighwayCrossing11? _highwayCrossing;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayCrossing11? get highwayCrossing => _highwayCrossing;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayCrossingData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayCrossing = await _repository.fetchHighwayCrossing(documentId);
      if (_highwayCrossing == null) {
        _errorMessage = 'No data found.';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
