import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/first_aid_on_road_model.dart';

class HighwayFirstAidOnTheRoadRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayFirstAidOnTheRoad> getFirstAidOnTheRoadDocument() async {
    try {
      var snapshot = await _firestore
          .collection("highwaycode_Vehicle_maintenance_safety_and_security")
          .doc('First aid on the road')
          .get();
      if (snapshot.exists) {
        return HighwayFirstAidOnTheRoad.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // rethrow to be caught by the provider
    }
  }
}
