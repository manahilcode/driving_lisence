// Provider class for HighwaySignals
import 'package:flutter/material.dart';

import '../model/signal_model.dart';
import '../repo/signal_repo.dart';

class HighwaySignalsProvider extends ChangeNotifier {
  final HighwaySignalsRepository _repository = HighwaySignalsRepository();

  HighwaySignals? _highwaySignals;
  HighwaySignals? get highwaySignals => _highwaySignals;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchHighwaySignals(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwaySignals = await _repository.fetchHighwaySignalsData(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}