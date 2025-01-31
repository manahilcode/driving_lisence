import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/other_vehicle_model.dart';

class HighwayOtherVehiclesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayOtherVehiclesModel> fetchHighwayOtherVehiclesData() async {
    try {
      final docSnapshot = await _firestore.collection("highwaycode_Road_users_requiring_extra").doc('Other vehicles').get();

      if (docSnapshot.exists) {
        return HighwayOtherVehiclesModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
