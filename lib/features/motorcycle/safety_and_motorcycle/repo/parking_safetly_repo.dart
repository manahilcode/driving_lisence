import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/parking_safety.dart'; // import model

class ParkingSafelyRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch ParkingSafely data from Firestore
  Future<ParkingSafely> getParkingSafelyData() async {
    try {
      // Fetch data from the Firestore collection 'parking_safely' and document 'parking_safely_data'
      DocumentSnapshot doc = await _firestore.collection('parking_safely').doc('parking_safely_data').get();

      if (doc.exists) {
        // Convert Firestore document data to ParkingSafely model
        return ParkingSafely.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data from Firebase: $e");
    }
  }
}
