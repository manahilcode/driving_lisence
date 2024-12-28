import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_about.dart';

class ThinkAboutRepositoryIncident {
  final FirebaseFirestore _firestore;

  ThinkAboutRepositoryIncident(this._firestore);

  Future<ThinkAboutModelIncident> fetchThinkAbout(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_Incidents_accidents_and_emergencies').doc(documentId).get();
      if (doc.exists) {
        return ThinkAboutModelIncident.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
