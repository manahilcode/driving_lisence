import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/vehicle_maintaince_model.dart';

class VehicleMaintenanceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<VehicleMaintenance> getVehicleMaintenanceDocument() async {
    try {
      var snapshot = await _firestore
          .collection("highwaycode_Vehicle_maintenance_safety_and_security")
          .doc('Vehicle maintenance')
          .get();
      if (snapshot.exists) {
        return VehicleMaintenance.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // Re-throws to be caught by the provider
    }
  }
}
