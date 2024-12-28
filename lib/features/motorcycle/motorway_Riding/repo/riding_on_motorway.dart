import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/riding_on_motorway.dart';

class MotorwayRidingRepositoryRiding {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to get the data from Firestore
  Future<MotorwayRidingModelRiding> getMotorwayRidingData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Motorway_riding').doc('Riding_on_the_motorway').get();
      if (doc.exists) {
        return MotorwayRidingModelRiding.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Data not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
