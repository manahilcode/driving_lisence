import 'package:cloud_firestore/cloud_firestore.dart';

import '../../hazard/model/hazard_models.dart';
import '../model/hazard_awareness1.dart';

class MotorcycleHazardawarenessRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'motorcycle_hazards';

  Future<List<MotorcycleMotorcycleHazard>> fetchMotorcycleHazards() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).get();
      return snapshot.docs.map((doc) {
        return MotorcycleMotorcycleHazard.fromFirestore(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error fetching motorcycle hazards: $e');
    }
  }
}
