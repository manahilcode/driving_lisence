import 'package:flutter/material.dart';

import '../model/meeting_standard.dart';
import '../repo/meeting_standard.dart';

class StandardsNotifier extends ChangeNotifier {
  final StandardsRepositoryIncident repository;

  StandardsModelIncident? _standards;
  bool _isLoading = false;
  String? _errorMessage;

  StandardsModelIncident? get standards => _standards;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  StandardsNotifier({required this.repository});

  Future<void> loadStandards(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _standards = await repository.fetchStandards(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
