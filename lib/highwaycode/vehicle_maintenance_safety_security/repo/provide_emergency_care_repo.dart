import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/provide_emergency_care_model.dart';

class ProvideEmergencyCareRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProvideEmergencyCare> getEmergencyCareDocument() async {
    try {
      var snapshot = await _firestore
          .collection("highwaycode_Vehicle_maintenance_safety_and_security")
          .doc('Provide emergency care')
          .get();
      if (snapshot.exists) {
        return ProvideEmergencyCare.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // Re-throws to be caught by the provider
    }
  }
}
