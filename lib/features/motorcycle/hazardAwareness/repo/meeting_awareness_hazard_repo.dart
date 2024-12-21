import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_with_Standard.dart';

class HazardAwarenessMeetingStandardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'hazard_awareness_meeting_standard';

  Future<List<HazardAwarenessMeetingStandard>> fetchHazardAwarenessMeetingStandard() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).get();
      return snapshot.docs.map((doc) {
        return HazardAwarenessMeetingStandard.fromFirestore(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error fetching hazard awareness meeting standard: $e');
    }
  }
}
