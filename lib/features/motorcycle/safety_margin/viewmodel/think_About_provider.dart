import 'package:flutter/foundation.dart';

import '../model/think_about_model.dart';
import '../repo/think_About_repo.dart';

class SafetyMarginNotifier extends ChangeNotifier {
  SafetyMarginThinkAboutModel? _safetyMarginData;
  bool _isLoading = false;
  String _errorMessage = '';

  SafetyMarginThinkAboutModel? get safetyMarginData => _safetyMarginData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final SafetyMarginThinkAboutRepository _repository;

  SafetyMarginNotifier(this._repository);

  // Fetch data and notify listeners
  Future<void> fetchSafetyMarginData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _safetyMarginData = await _repository.fetchSafetyMarginData();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
