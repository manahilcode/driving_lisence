// Repository Class
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/roundabouts_model.dart';

class RoundaboutsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RoundaboutsModel> fetchJunctionText(String documentId) async {
    try {
      final doc = await _firestore.collection('highwaycode_Animals_being_herded').doc(documentId).get();
      if (doc.exists) {
        return RoundaboutsModel.fromFirestore(doc);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching junction text data: $e');
    }
  }
}