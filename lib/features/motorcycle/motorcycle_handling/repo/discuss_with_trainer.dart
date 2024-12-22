import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/discuss_with_trainer.dart';

class TrainerDiscussionPracticeRepositoryHandling {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<TrainerDiscussionPracticeHandling?> fetchTrainerDiscussionPractice(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return TrainerDiscussionPracticeHandling.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching TrainerDiscussionPractice data: $e');
      return null;
    }
  }
}
