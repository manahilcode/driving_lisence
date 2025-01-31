// Provider class for HighwayTurningLeft
import 'package:flutter/material.dart';

import '../model/turning_left_model.dart';
import '../repo/turning_left_repo.dart';

class HighwayTurningLeftProvider extends ChangeNotifier {
  final HighwayTurningLeftRepository _repository = HighwayTurningLeftRepository();

  HighwayTurningLeft? _highwayTurningLeft;
  HighwayTurningLeft? get highwayTurningLeft => _highwayTurningLeft;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchHighwayTurningLeft(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayTurningLeft = await _repository.fetchHighwayTurningLeftData(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
