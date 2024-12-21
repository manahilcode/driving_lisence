import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/discuss_with_trainer.dart';

class SafetyMarginDiscussRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SafetyMarginDiscussModel> getSafetyMarginData(String collection, String document) async {
    try {
      DocumentSnapshot snapshot =
      await _firestore.collection(collection).doc(document).get();

      if (snapshot.exists) {
        return SafetyMarginDiscussModel.fromFirestore(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
