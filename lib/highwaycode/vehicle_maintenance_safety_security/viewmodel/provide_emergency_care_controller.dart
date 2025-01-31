import 'package:flutter/material.dart';

import '../model/provide_emergency_care_model.dart';
import '../repo/provide_emergency_care_repo.dart';

class ProvideEmergencyCareProvider with ChangeNotifier {
  final ProvideEmergencyCareRepository _repository = ProvideEmergencyCareRepository();
  ProvideEmergencyCare? _document;
  bool _isLoading = true;
  String _error = '';

  ProvideEmergencyCare? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  ProvideEmergencyCareProvider() {
    fetchEmergencyCareDocument();
  }

  Future<void> fetchEmergencyCareDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getEmergencyCareDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Provide emergency care document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
