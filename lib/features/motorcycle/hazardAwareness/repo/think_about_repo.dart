import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_about_model.dart';

class HazardAwarenessThinkAboutRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'hazard_awareness_think_about';

  // Fetch hazard awareness "Think About" data from Firestore
  Future<HazardAwarenessThinkAbout> fetchHazardAwarenessThinkAbout() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc('hazard_awareness_think_about_data').get();
      if (snapshot.exists) {
        return HazardAwarenessThinkAbout.fromFirestore(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('No hazard awareness think about data found.');
      }
    } catch (e) {
      throw Exception('Error fetching hazard awareness think about data: $e');
    }
  }
}
