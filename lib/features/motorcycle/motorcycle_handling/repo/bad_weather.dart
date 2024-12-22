import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/bad_weather.dart';

class WeatherConditionsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<WeatherBadConditions?> fetchWeatherConditions(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return WeatherBadConditions.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching WeatherConditions data: $e');
      return null;
    }
  }
}
