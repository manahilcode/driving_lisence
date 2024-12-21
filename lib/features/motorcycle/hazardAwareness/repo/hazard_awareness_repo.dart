import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/hazard_awareness_model.dart';

class MotorCycleHazardAwarenessRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'hazard_awareness';

  Future<List<MotorcycleHazardAwareness>> fetchHazards() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).get();
      return snapshot.docs.map((doc) {
        return MotorcycleHazardAwareness.fromFirestore(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error fetching hazards: $e');
    }
  }
}
