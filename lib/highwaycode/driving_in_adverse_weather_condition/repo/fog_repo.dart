import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/fog_model.dart';

class HighwayFogRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from the Firestore document
  Future<HighwayFog?> fetchFogData(String documentId) async {
    try {
      final doc = await _firestore.collection("highwaycode_Driving_in_adverse_weather_conditions").doc(documentId).get();
      if (doc.exists) {
        return HighwayFog.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch Fog data: $e');
    }
  }
}
