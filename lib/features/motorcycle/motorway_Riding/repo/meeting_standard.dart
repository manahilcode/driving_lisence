import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_standard.dart';

class MotorwaySafetyRepositoryRiding {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get data from Firestore
  Future<MeetingStandardRiding> getMotorwaySafety() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('motorcycle_Motorway_riding') // Collection name in Firestore
          .doc('Meeting_the_standards') // Document ID
          .get();

      if (doc.exists) {
        return MeetingStandardRiding.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Motorway safety not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
