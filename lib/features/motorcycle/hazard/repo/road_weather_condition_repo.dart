import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/road_weather_condition.dart';

class MotorcycleRoadWeatherConditionsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch a `MotorcycleRoadWeatherConditions` object from Firestore.
  Future<MotorcycleRoadWeatherConditions?> fetchRoadWeatherConditions(String collectionName, String docName) async {
    try {
      // Fetch the document from the given collection and document name
      DocumentSnapshot docSnapshot = await _firestore.collection(collectionName).doc(docName).get();

      // Check if the document exists
      if (docSnapshot.exists) {
        // Extract data and map to the MotorcycleRoadWeatherConditions model
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return MotorcycleRoadWeatherConditions.fromMap(data);
      } else {
        // Document not found
        print('Document not found in collection $collectionName with id $docName.');
        return null;
      }
    } catch (e) {
      // Handle any errors
      print('Error fetching MotorcycleRoadWeatherConditions: $e');
      return null; // You can also throw the error or return a default value
    }
  }
}
