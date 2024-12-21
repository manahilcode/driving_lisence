import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/pedestrain_crossing_model.dart';

class PedestrianCrossingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<PedestrianCrossingVul> fetchPedestrianCrossingData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('pedestrian_crossing').doc(documentId).get();
      if (doc.exists) {
        return PedestrianCrossingVul.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
