import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/moving_hazard.dart';

class MovingHazardsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'moving_hazards';

  Future<List<MovingHazards>> fetchMovingHazards() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).get();
      return snapshot.docs.map((doc) {
        return MovingHazards.fromFirestore(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error fetching moving hazards: $e');
    }
  }
}
