import 'package:cloud_firestore/cloud_firestore.dart';

import '../../attitude/model/discusstion_with_trainer.dart';
import '../model/things_discuss.dart';

class TrainerDiscussionRepositoryLoading {
  final FirebaseFirestore _firestore;

  TrainerDiscussionRepositoryLoading(this._firestore);

  Future<TrainerDiscussionModelLoading> fetchTrainerDiscussion(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_Motorcycle_loading').doc(documentId).get();
      if (doc.exists) {
        return TrainerDiscussionModelLoading.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
