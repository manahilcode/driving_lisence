import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/static_hazard_model.dart';

class StaticHazardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'static_hazards';

  // Fetch static hazard data from Firestore
  Future<StaticHazard> fetchStaticHazard() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc('static_hazard_data').get();
      if (snapshot.exists) {
        return StaticHazard.fromFirestore(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('No static hazard data found.');
      }
    } catch (e) {
      throw Exception('Error fetching static hazard data: $e');
    }
  }
}