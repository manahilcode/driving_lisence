import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/meeting_standard.dart';

class StandardsRepositorySign {
  final FirebaseFirestore firestore;

  StandardsRepositorySign({required this.firestore});

  Future<MeetingStandardSign> fetchStandardsData(String collection, String document) async {
    try {
      final docSnapshot = await firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        return MeetingStandardSign.fromJson(data);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data from Firestore: $e');
    }
  }
}
