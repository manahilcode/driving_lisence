import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/motorcycle/other_type_of%20_vehicle/model/discussion_with_trainer.dart';

class DiscussionPracticeInfoRepository1 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DiscussionPracticeInfoOtherVehicle?> fetchDiscussionPracticeInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return DiscussionPracticeInfoOtherVehicle.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching discussion practice info: $e');
      return null;
    }
  }
}
