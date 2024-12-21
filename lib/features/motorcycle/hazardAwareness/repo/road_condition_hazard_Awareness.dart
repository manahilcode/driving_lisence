import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/raod_condition.dart';

class RoadConditionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'road_conditions';

  Future<List<RoadConditionHazardAwareness>> fetchRoadConditions() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).get();
      return snapshot.docs.map((doc) {
        return RoadConditionHazardAwareness.fromFirestore(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error fetching road conditions: $e');
    }
  }
}
