import 'package:flutter/material.dart';

import '../model/stoping_an_incident.dart';
import '../repo/stoping_an_incident.dart';

class IncidentStopNotifier extends ChangeNotifier {
  final IncidentRepository1 repository;

  IncidentModelIncident? _incident;
  bool _isLoading = false;
  String? _errorMessage;

  IncidentModelIncident? get incident => _incident;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  IncidentStopNotifier({required this.repository});

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
