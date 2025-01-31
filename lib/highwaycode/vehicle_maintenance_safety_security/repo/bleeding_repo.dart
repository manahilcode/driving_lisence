import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/bleeding_model.dart';

class HighwayBleedingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayBleeding> getBleedingDocument() async {
    try {
      var snapshot = await _firestore
          .collection("highwaycode_Vehicle_maintenance_safety_and_security")
          .doc('Bleeding')
          .get();
      if (snapshot.exists) {
        return HighwayBleeding.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // rethrow to be caught by the provider
    }
  }
}
