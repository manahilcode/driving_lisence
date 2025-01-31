import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/safety_code_for_driver_model.dart';

class SafetyCodeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SafetyCodeForNewDrivers> getSafetyCodeDocument() async {
    try {
      var snapshot = await _firestore
          .collection("highwaycode_Vehicle_maintenance_safety_and_security")
          .doc('Safety code for new drivers')
          .get();
      if (snapshot.exists) {
        return SafetyCodeForNewDrivers.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // Re-throws to be caught by the provider
    }
  }
}
