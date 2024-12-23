import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/lane_and_junction.dart';

class QuestionRepositoryLane {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<LaneAndJunction?> fetchQuestions(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return LaneAndJunction.fromMap(data);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch questions: $e');
    }
  }
}
