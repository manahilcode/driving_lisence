import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/stopping_distance_model.dart';

class StoppingDistanceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<StoppingDistanceModel> fetchStoppingDistanceData() async {
    try {
      // Assuming the collection is 'stopping_distance' and the document is 'distance_info'
      DocumentSnapshot snapshot = await _firestore
          .collection('stopping_distance')
          .doc('distance_info')
          .get();

      if (snapshot.exists) {
        return StoppingDistanceModel.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
