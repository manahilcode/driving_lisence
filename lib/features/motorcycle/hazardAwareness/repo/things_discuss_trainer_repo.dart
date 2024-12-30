import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/things_discuss_trainer.dart';

class HazardAwarenessThingsDiscussRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'motorcycle_Hazard_awareness';

  // Fetch hazard awareness data from Firestore
  Future<HazardAwarenessThingsDiscuss> fetchHazardAwareness() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc('Things_to_discuss_and_practise_with_your_trainer_Continue ').get();
      if (snapshot.exists) {
        return HazardAwarenessThingsDiscuss.fromFirestore(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('No hazard awareness data found.');
      }
    } catch (e) {
      throw Exception('Error fetching hazard awareness data: $e');
    }
  }
}
