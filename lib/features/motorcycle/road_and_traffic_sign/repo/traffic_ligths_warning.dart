import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/traffic_lights_warning.dart';

class TrafficLightsWarningRepository {
  final FirebaseFirestore _firestore;

  TrafficLightsWarningRepository(this._firestore);

  Future<TrafficLightsWarning> fetchTrafficLightsWarning(String collection, String document) async {
    try {
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        return TrafficLightsWarning.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist.");
      }
    } catch (e) {
      throw Exception("Failed to fetch Traffic Lights Warning: $e");
    }
  }
}