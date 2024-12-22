import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/large_vehicle_info.dart';

class LargeVehicleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<LargeVehicleInfo?> fetchLargeVehicleInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return LargeVehicleInfo.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
