import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/helping_other_first_aid.dart';

class FirstAidRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FirstAidData> fetchFirstAidData(String documentId) async {
    try {
      DocumentSnapshot snapshot =
      await _firestore.collection('motorcycle').doc(documentId).get();

      if (snapshot.exists && snapshot.data() != null) {
        return FirstAidData.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
