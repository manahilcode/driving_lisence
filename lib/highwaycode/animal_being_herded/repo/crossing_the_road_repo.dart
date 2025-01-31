// Repository Class
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/crossing_the_road_model.dart';

class CrossingTheRoadRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CrossingTheRoadModel> getPoint(String documentId) async {
    try {
      final doc = await _firestore.collection('highwaycode_Animals_being_herded').doc(documentId).get();
      if (doc.exists) {
        return CrossingTheRoadModel.fromFirestore(doc);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching point data: $e');
    }
  }
}