import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/pedestrain_model.dart'; // Replace with the correct path

class PedestrianRepositoryVal {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<PedestrianVal> fetchPedestrianData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('pedestrian').doc(documentId).get();
      if (doc.exists) {
        return PedestrianVal.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
