import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/moving_hazard.dart';

class MovingHazardsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'motorcycle_Hazard_awareness';

  Future<MovingHazards> fetchMovingHazards() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc("Moving_hazards").get();
      final data = snapshot.data() as Map<String, dynamic>;
      final model = MovingHazards.fromFirestore(data);
      return model;
    } catch (e) {
      throw Exception('Error fetching moving hazards: $e');
    }
  }
}
