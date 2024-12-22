import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/weather_Condition.dart';

class WeatherConditionsRepositoryHandling {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<WeatherConditionsHandling?> fetchWeatherConditions(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return WeatherConditionsHandling.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching WeatherConditions data: $e');
      return null;
    }
  }
}
