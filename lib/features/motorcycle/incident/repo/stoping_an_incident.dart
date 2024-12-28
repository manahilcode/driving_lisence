import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/stoping_an_incident.dart';

class IncidentRepository1 {
  final FirebaseFirestore _firestore;

  IncidentRepository1(this._firestore);

  Future<IncidentModelIncident> fetchIncident(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_Incidents_accidents_and_emergencies').doc(documentId).get();
      if (doc.exists) {
        return IncidentModelIncident.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
