import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/older_and_disabled.dart'; // Replace with the correct path

class OlderAndDisabledPedestriansRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<OlderAndDisabledPedestrians> fetchOlderAndDisabledPedestriansData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('older_and_disabled_pedestrians').doc(documentId).get();
      if (doc.exists) {
        return OlderAndDisabledPedestrians.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
