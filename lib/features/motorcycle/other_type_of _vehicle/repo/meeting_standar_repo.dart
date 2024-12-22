import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/meeting_standard.dart';

class MeetingStandardsRepositoryOtherVehicle1 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MeetingStandardsInfoOtherVehicle?> fetchMeetingStandardsInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return MeetingStandardsInfoOtherVehicle.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
