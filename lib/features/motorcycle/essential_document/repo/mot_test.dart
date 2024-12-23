import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/mot_test.dart';

class MotTestDetailsRepository {
  final FirebaseFirestore _firestore;

  MotTestDetailsRepository(this._firestore);

  Future<MotTestDetails> fetchMotTestDetails(String collection, String document) async {
    try {
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        return MotTestDetails.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist.");
      }
    } catch (e) {
      throw Exception("Failed to fetch MOT Test Details: $e");
    }
  }
}
