import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/vehicle_security_model.dart';

class VehicleSecurityRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<VehicleSecurity> getVehicleSecurityDocument() async {
    try {
      var snapshot = await _firestore
          .collection("highwaycode_Vehicle_maintenance_safety_and_security")
          .doc('Vehicle security')
          .get();
      if (snapshot.exists) {
        return VehicleSecurity.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // Re-throws to be caught by the provider
    }
  }
}
