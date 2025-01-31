import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/deal_with_danger_model.dart';

class HighwayCodeDealWithDangerRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCodeDealWithDanger> getDealWithDangerDocument() async {
    try {
      var snapshot = await _firestore
          .collection("highwaycode_Vehicle_maintenance_safety_and_security")
          .doc('Deal with danger')
          .get();
      if (snapshot.exists) {
        return HighwayCodeDealWithDanger.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // rethrow to be caught by the provider
    }
  }
}
