import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_standard_model.dart';

class MeetingTheStandardsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MeetingTheStandardsModel> fetchMeetingTheStandardsData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return MeetingTheStandardsModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
