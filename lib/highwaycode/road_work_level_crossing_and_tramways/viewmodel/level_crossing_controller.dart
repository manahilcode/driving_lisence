import 'package:flutter/material.dart';

import '../model/level_crossing_model.dart';
import '../repo/level_crossing_repo.dart';

class HighwayLevelCrossingsProvider with ChangeNotifier {
  final HighwayLevelCrossingsRepository _repository = HighwayLevelCrossingsRepository();
  HighwayLevelCrossingsModel? _crossingData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayLevelCrossingsModel? get crossingData => _crossingData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayLevelCrossing() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _crossingData = await _repository.fetchHighwayLevelCrossing();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
