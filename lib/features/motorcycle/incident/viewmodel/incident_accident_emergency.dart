import 'package:flutter/material.dart';

import '../model/incident_accident_emergency.dart';
import '../repo/incident_accident_emergency.dart';

class IncidentNotifier extends ChangeNotifier {
  final IncidentRepository repository;

  IncidentModel? _incident;
  bool _isLoading = false;
  String? _errorMessage;

  IncidentModel? get incident => _incident;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  IncidentNotifier({required this.repository});

  Future<void> loadIncident(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _incident = await repository.fetchIncident(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
