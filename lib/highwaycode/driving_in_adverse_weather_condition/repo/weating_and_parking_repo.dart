import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/weating_and_parking_model.dart';

class WaitingAndParkingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection and document
  Future<WaitingAndParking> fetchWaitingAndParkingData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_Driving_in_adverse_weather_conditions")// Specify your collection name
          .doc('Waiting and parking')                    // Specify your document ID
          .get();

      if (docSnapshot.exists) {
        return WaitingAndParking.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}