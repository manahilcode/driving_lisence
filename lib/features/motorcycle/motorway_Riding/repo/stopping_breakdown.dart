
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/stopping_breakdown.dart';

class StoppingBreakdownRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch emergency telephone positioning data from Firestore
  Future<StoppingBreakdownModel> getEmergencyTelephonePositioningData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Motorway_riding').doc('Stopping_and_breakdowns').get();
      if (doc.exists) {
        return StoppingBreakdownModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Emergency telephone positioning data not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
