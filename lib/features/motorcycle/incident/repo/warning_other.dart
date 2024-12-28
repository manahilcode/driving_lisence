import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/warning_other.dart';

class WarningIncidentRepository {
  final FirebaseFirestore _firestore;

  WarningIncidentRepository(this._firestore);

  Future<WarningIncidentModel> fetchWarningIncident(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_Incidents_accidents_and_emergencies').doc(documentId).get();
      if (doc.exists) {
        return WarningIncidentModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
