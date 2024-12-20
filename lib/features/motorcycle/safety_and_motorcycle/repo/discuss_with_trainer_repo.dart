import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/discuss_with_trainee_model.dart';

class MotorCycleTrainerDiscussionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch Trainer Discussion data from Firestore
  Future<TrainerDiscussion> getTrainerDiscussionData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('trainer_discussion').doc('data').get();

      if (doc.exists) {
        return TrainerDiscussion.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data from Firebase: $e");
    }
  }
}
