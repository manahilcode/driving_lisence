import 'package:cloud_firestore/cloud_firestore.dart';

import '../../hazard/model/hazard_models.dart';
import '../model/hazard_awareness1.dart';

class MotorcycleHazardawarenessRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'motorcycle_Hazard_awareness';

  Future<MotorcycleMotorcycleHazard> fetchMotorcycleHazards() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc("Hazard_awareness1").get();
      final data  = snapshot.data() as Map<String, dynamic>;
      final model  = MotorcycleMotorcycleHazard.fromFirestore(data);
      return model;
    } catch (e) {
      throw Exception('Error fetching motorcycle hazards: $e');
    }
  }
}
