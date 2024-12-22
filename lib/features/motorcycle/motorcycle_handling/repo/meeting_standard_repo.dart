import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_standard.dart';

class MeetingStandardsInfoRepositoryHandling {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MeetingStandardsInfoHandling?> fetchMeetingStandardsInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return MeetingStandardsInfoHandling.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching MeetingStandardsInfo: $e');
      return null;
    }
  }
}
