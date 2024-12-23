import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/reporting_an_incident.dart';

class IncidentReportRepository {
  final FirebaseFirestore _firestore;

  IncidentReportRepository(this._firestore);

  Future<IncidentReportModel> fetchIncidentReport(String documentId) async {
    try {
      final doc = await _firestore.collection('incidentReports').doc(documentId).get();
      if (doc.exists) {
        return IncidentReportModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
