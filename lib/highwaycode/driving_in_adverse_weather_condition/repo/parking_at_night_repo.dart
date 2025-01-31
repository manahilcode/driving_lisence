import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/parking_at_night_model.dart';

class ParkingAtNightRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from the Firestore collection and document
  Future<ParkingAtNight> fetchParkingAtNightData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_Driving_in_adverse_weather_conditions") // Specify your collection name
          .doc('Parking at night')                // Specify your document ID
          .get();

      if (docSnapshot.exists) {
        return ParkingAtNight.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
