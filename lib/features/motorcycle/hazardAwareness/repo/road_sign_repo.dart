import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/road_sign_model.dart';

class RoadSignsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'road_signs';

  Future<List<RoadSigns>> fetchRoadSigns() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).get();
      return snapshot.docs.map((doc) {
        return RoadSigns.fromFirestore(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error fetching road signs: $e');
    }
  }
}
