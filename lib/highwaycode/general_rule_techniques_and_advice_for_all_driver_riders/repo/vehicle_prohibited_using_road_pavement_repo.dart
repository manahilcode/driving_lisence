import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/vehicle_prohibited_using_road_pavement_model.dart';

class ProhibitedVehicleRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Fetch the document from Firestore
  Future<ProhibitedVehicle> fetchProhibitedVehicleData() async {
    try {
      DocumentSnapshot docSnapshot = await _firebaseFirestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders")
          .doc('Vehicles prohibited from using roads and pavements')
          .get();

      if (docSnapshot.exists) {
        // Map the Firestore document to ProhibitedVehicle model
        return ProhibitedVehicle.fromFirestore(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
