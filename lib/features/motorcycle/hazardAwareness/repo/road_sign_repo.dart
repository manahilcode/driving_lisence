import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/road_sign_model.dart';

class RoadSignsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'motorcycle_Hazard_awareness';
//"motorcycle_Hazard_awareness", "Road_signs"
  Future<RoadSigns> fetchRoadSigns() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc("Road_signs").get();
      final data  = snapshot.data() as Map<String, dynamic>;
      final model = RoadSigns.fromFirestore(data);

      return model;
    } catch (e) {
      throw Exception('Error fetching road signs: $e');
    }
  }
}
