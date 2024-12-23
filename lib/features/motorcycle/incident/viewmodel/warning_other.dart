import 'package:flutter/material.dart';

import '../model/warning_other.dart';
import '../repo/warning_other.dart';

class WarningIncidentNotifier extends ChangeNotifier {
  final WarningIncidentRepository repository;

  WarningIncidentModel? _warningIncident;
  bool _isLoading = false;
  String? _errorMessage;

  WarningIncidentModel? get warningIncident => _warningIncident;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  WarningIncidentNotifier({required this.repository});

  Future<void> loadWarningIncident(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _warningIncident = await repository.fetchWarningIncident(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
