import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/burn_model.dart';

class HighwayBurnsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayBurns> getBurnsDocument() async {
    try {
      var snapshot =
          await _firestore
              .collection("highwaycode_Vehicle_maintenance_safety_and_security")
              .doc('Burns').get();
      if (snapshot.exists) {
        return HighwayBurns.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // rethrow to be caught by the provider
    }
  }
}
