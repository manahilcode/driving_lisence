import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/hazard_awareness_model.dart';

class MotorCycleHazardAwarenessRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'hazard_awareness';

  Future<MotorcycleHazardAwareness> fetchHazards() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc().get();
      final data = snapshot.data() as Map<String, dynamic>;
      final motorcycle  = MotorcycleHazardAwareness.fromFirestore(data);
      return motorcycle;
    } catch (e) {
      throw Exception('Error fetching hazards: $e');
    }
  }
}
