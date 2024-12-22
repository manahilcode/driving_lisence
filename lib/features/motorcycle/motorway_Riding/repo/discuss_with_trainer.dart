import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/dicuss_with_trainer.dart';

class TrainerPracticeRepositoryRiding {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch training data from Firestore
  Future<TrainerPracticeModelRiding> getTrainerPracticeData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Motorway_training').doc('Discuss_and_practice_with_trainer').get();
      if (doc.exists) {
        return TrainerPracticeModelRiding.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Trainer practice data not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
