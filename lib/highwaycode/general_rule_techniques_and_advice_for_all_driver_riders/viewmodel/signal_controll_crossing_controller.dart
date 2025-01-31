// Provider class for SignalControlledCrossings
import 'package:flutter/material.dart';

import '../model/signal_controll_crossing_model.dart';
import '../repo/signal_controll_crossing_repo.dart';

class SignalControlledCrossingsProvider extends ChangeNotifier {
  final SignalControlledCrossingsRepository _repository = SignalControlledCrossingsRepository();

  SignalControlledCrossings? _signalControlledCrossings;
  SignalControlledCrossings? get signalControlledCrossings => _signalControlledCrossings;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchSignalControlledCrossings(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _signalControlledCrossings = await _repository.fetchSignalControlledCrossingsData(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}