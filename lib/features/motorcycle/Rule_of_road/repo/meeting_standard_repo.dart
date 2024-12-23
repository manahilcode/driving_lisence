// Repository class
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../rule_of_road/model/model.dart';
import '../model/meeting_standard_model.dart';

class MeetingStandardsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MeetingStandardsRule> fetchMeetingStandards(String collection, String document) async {
    try {
      final snapshot = await _firestore.collection(collection).doc(document).get();
      if (snapshot.exists) {
        return MeetingStandardsRule.fromMap(snapshot.data()!);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}