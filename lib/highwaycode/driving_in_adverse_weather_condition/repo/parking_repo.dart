import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/parking_model.dart';

class HighwayParkingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayParking> fetchHighwayParkingData() async {
    try {
      final doc = await _firestore
          .collection("highwaycode_Driving_in_adverse_weather_conditions") // Replace with the actual collection name
          .doc('Parking') // Replace with the actual document ID
          .get();

      if (doc.exists) {
        return HighwayParking.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
