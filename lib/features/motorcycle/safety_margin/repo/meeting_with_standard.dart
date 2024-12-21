import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../motor_way_Driving/model/model.dart';
import '../model/meeting_with_standard.dart';

class MeetingTheStandardsRepositorySafetyMargin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MeetingTheStandards_Safety_Margin> getMeetingTheStandardsData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('meeting_the_standards').doc('data').get();

      if (doc.exists) {
        return MeetingTheStandards_Safety_Margin.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching Meeting the Standards data: $e");
    }
  }
}
