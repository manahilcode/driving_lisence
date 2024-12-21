import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_with_Standard.dart'; // Replace with correct path

class MeetingStandardsRepositoryVulnurable {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<MeetingStandardsVulnurable> fetchMeetingStandardsData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('meeting_standards').doc(documentId).get();
      if (doc.exists) {
        return MeetingStandardsVulnurable.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
