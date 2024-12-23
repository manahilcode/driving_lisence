import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/incident_accident_emergency.dart';

class IncidentRepository {
  final FirebaseFirestore _firestore;

  IncidentRepository(this._firestore);

  Future<IncidentModel> fetchIncident(String documentId) async {
    try {
      final doc = await _firestore.collection('incidents').doc(documentId).get();
      if (doc.exists) {
        return IncidentModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
