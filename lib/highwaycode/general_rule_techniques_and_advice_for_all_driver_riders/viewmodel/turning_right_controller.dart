// Provider class for HighwayTurningRight
import 'package:flutter/material.dart';

import '../model/turning_right_model.dart';
import '../repo/turning_right_repo.dart';

class HighwayTurningRightProvider extends ChangeNotifier {
  final HighwayTurningRightRepository _repository = HighwayTurningRightRepository();

  HighwayTurningRight? _highwayTurningRight;
  HighwayTurningRight? get highwayTurningRight => _highwayTurningRight;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchHighwayTurningRight(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayTurningRight = await _repository.fetchHighwayTurningRightData(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
