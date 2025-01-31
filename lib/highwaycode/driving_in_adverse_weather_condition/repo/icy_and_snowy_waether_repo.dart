import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/icy_and_snowy_waether_model.dart';

class IcySnowyWeatherRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<IcySnowyWeather?> fetchIcySnowyWeather(String documentId) async {
    try {
      final doc = await _firestore.collection("highwaycode_Driving_in_adverse_weather_conditions").doc(documentId).get();
      if (doc.exists) {
        return IcySnowyWeather.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch Icy and Snowy Weather data: $e');
    }
  }
}
