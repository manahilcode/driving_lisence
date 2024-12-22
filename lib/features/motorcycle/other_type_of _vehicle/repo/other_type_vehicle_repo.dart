import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/other_type_vehicle_model.dart';

class OtherVehicleRepository1 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<OtherVehicleInfo1?> fetchOtherVehicleInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return OtherVehicleInfo1.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
