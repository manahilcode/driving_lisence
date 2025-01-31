import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/vehicle_handling/pages/windy_weather.dart';
import '../model/windy_weather_model.dart';

class HighwayWindyWeatherRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection and document
  Future<WindyWeatherModelWindyWeather> fetchWindyWeatherData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_Driving_in_adverse_weather_conditions") // Specify your collection name
          .doc('Windy weather')              // Specify your document ID
          .get();

      if (docSnapshot.exists) {
        return WindyWeatherModelWindyWeather.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
