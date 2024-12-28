import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/raod_condition.dart';

class RoadConditionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'motorcycle_Hazard_awareness';

  Future<RoadConditionHazardAwareness> fetchRoadConditions() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc("Road_and_weather_conditions").get();
      final data = snapshot.data() as Map<String, dynamic>;
      final model = RoadConditionHazardAwareness.fromFirestore(data);
      return model;
    } catch (e) {
      throw Exception('Error fetching road conditions: $e');
    }
  }
}
