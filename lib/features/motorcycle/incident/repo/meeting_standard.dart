import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_standard.dart';

class StandardsRepositoryIncident {
  final FirebaseFirestore _firestore;

  StandardsRepositoryIncident(this._firestore);

  Future<StandardsModelIncident> fetchStandards(String documentId) async {
    try {
      final doc = await _firestore.collection('standards').doc(documentId).get();
      if (doc.exists) {
        return StandardsModelIncident.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
