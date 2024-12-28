import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_with_Standard.dart';

class HazardAwarenessMeetingStandardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'motorcycle_Hazard_awareness';

  Future<HazardAwarenessMeetingStandard> fetchHazardAwarenessMeetingStandard() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc("Meeting_the_standards").get();
      final data = snapshot.data() as Map<String, dynamic>;
      final model = HazardAwarenessMeetingStandard.fromFirestore(data);
      return model;
    } catch (e) {
      throw Exception('Error fetching hazard awareness meeting standard: $e');
    }
  }
}
