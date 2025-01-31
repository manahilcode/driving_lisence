


// Provider class for SignalCarriageway
import 'package:flutter/material.dart';

import '../model/signal_carriageway_model.dart';
import '../repo/signal_carriageway_repo.dart';

class SignalCarriagewayProvider extends ChangeNotifier {
  final SignalCarriagewayRepository _repository = SignalCarriagewayRepository();

  SignalCarriageway? _signalCarriageway;
  SignalCarriageway? get signalCarriageway => _signalCarriageway;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchSignalCarriageway(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _signalCarriageway = await _repository.fetchSignalCarriagewayData(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
