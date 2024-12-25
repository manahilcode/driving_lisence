import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/motorway_riding.dart';

class MotorwayRidingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get data from Firestore
  Future<MotorwayRiding> getMotorwayRiding() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('motorway_riding') // Collection name in Firestore
          .doc('motorway_riding_doc') // Document ID
          .get();

      if (doc.exists) {
        return MotorwayRiding.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Motorway riding data not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}