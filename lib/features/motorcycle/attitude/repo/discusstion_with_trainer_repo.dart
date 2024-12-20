import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/discusstion_with_trainer.dart';

class TrainerDiscussionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<TrainerDiscussionModel> fetchTrainerDiscussionInfo(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return TrainerDiscussionModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
