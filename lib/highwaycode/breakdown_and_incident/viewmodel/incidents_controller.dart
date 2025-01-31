import 'package:flutter/material.dart';

import '../model/incidents_model.dart';
import '../repo/incidents_repo.dart';

class IncidentAdviceProvider11 extends ChangeNotifier {
  IncidentAdvice? _incidentAdvice;
  bool _isLoading = true;
  String _errorMessage = '';

  IncidentAdvice? get incidentAdvice => _incidentAdvice;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchIncidentAdvice() async {
    _isLoading = true;
    notifyListeners();

    try {
      _incidentAdvice = await IncidentAdviceRepository().fetchIncidentAdvice();
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
