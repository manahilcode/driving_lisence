import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/weather_condition.dart';

class WeatherConditionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch weather condition data from Firestore
  Future<WeatherConditionModel> fetchWeatherConditionData() async {
    try {
      // Assuming the collection is 'weather_conditions' and the document is 'condition_info'
      DocumentSnapshot snapshot = await _firestore
          .collection('weather_conditions')
          .doc('condition_info')
          .get();

      if (snapshot.exists) {
        return WeatherConditionModel.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
