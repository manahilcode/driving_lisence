import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/power_vehicle_model.dart';

class PoweredVehicleInfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<PoweredVehicleInfo?> fetchPoweredVehicleInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return PoweredVehicleInfo.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching powered vehicle info: $e');
      return null;
    }
  }
}
