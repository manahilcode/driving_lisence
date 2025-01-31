import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/hot_weather_model.dart';

class HotWeatherRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from the Firestore document
  Future<HighWayHotWeather?> fetchHotWeatherData(String documentId) async {
    try {
      final doc = await _firestore.collection("highwaycode_Driving_in_adverse_weather_conditions").doc(documentId).get();
      if (doc.exists) {
        return HighWayHotWeather.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch Hot Weather data: $e');
    }
  }
}
