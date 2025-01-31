import 'package:flutter/material.dart';

import '../model/flashing_headlight_model.dart';
import '../repo/flashing_headlight_repo.dart';

class FlashingHeadlightsProvider extends ChangeNotifier {
  FlashingHeadlights? _flashingHeadlightsData;
  bool _isLoading = true;
  String _errorMessage = '';

  FlashingHeadlights? get flashingHeadlightsData => _flashingHeadlightsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchFlashingHeadlightsData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _flashingHeadlightsData = await FlashingHeadlightsRepository().fetchFlashingHeadlightsData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
