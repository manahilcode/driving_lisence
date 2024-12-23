import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_the_standard.dart';

class DrivingInfoRepositoryEss {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<MeetingTheStandardDocument> fetchDrivingInfo() async {
    try {
      DocumentSnapshot snapshot = await _firebaseFirestore.collection('drivingInfo').doc('your_doc_id').get();

      if (snapshot.exists) {
        return MeetingTheStandardDocument.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Data not found");
      }
    } catch (e) {
      rethrow;
    }
  }
}
