import 'package:flutter/material.dart';

import '../model/reporting_an_incident.dart';
import '../repo/reporting_an_incident.dart';

class IncidentReportNotifier extends ChangeNotifier {
  final IncidentReportRepository repository;

  IncidentReportModel? _incidentReport;
  bool _isLoading = false;
  String? _errorMessage;

  IncidentReportModel? get incidentReport => _incidentReport;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  IncidentReportNotifier({required this.repository});

  Future<void> loadIncidentReport(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _incidentReport = await repository.fetchIncidentReport(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
