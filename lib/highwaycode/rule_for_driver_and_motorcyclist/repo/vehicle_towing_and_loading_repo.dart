import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/vehicle_towing_and_loading_model.dart';

class VehicleTowingAndLoadingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<VehicleTowingAndLoadingModel> fetchVehicleTowingAndLoading() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Rules_for_drivers_and_motorcyclists") // Replace with your collection name
          .doc('Vehicle towing and loading')  // Replace with actual document ID
          .get();

      if (docSnapshot.exists) {
        return VehicleTowingAndLoadingModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
