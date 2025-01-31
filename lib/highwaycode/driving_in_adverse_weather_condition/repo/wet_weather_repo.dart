import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/wet_weather_model.dart';

class HighwayWetWeatherRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection and document
  Future<HighwayWetWeather> fetchHighwayWetWeatherData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_Driving_in_adverse_weather_conditions") // Specify your collection name
          .doc('Wet weather')                    // Specify your document ID
          .get();

      if (docSnapshot.exists) {
        return HighwayWetWeather.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
