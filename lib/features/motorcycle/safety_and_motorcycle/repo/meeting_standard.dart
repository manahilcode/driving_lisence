import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_standard.dart';


class MeetingStandardRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch the motorcycle safety data from Firestore
  Future<MotorCycleMeetingStandard> getMotorcycleSafetyData() async {
    try {
      // Fetch data from the 'motorcycle_safety' collection and 'safety_data' document
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Safety_and_your_motorcycle').doc('Meeting_the_standards').get();

      if (doc.exists) {
        // Convert Firestore document data to MotorcycleSafety model
        return MotorCycleMeetingStandard.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data from Firebase: $e");
    }
  }
}
