import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/speed_limit.dart';

class SpeedLimitQuestionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch speed limit question data from Firestore
  Future<SpeedLimitModel> getSpeedLimitQuestionData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Motorway_riding').doc('Speed_limits_question').get();
      if (doc.exists) {
        return SpeedLimitModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Speed limit question data not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
