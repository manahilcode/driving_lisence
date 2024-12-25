import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_with_Standard.dart';

class HazardAwarenessMeetingStandardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'hazard_awareness_meeting_standard';

  Future<HazardAwarenessMeetingStandard> fetchHazardAwarenessMeetingStandard() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc("").get();
      final data = snapshot.data() as Map<String, dynamic>;
      final model = HazardAwarenessMeetingStandard.fromFirestore(data);
      return model;
    } catch (e) {
      throw Exception('Error fetching hazard awareness meeting standard: $e');
    }
  }
}
