import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/following_safety_model.dart';

class FollowingSafelyRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FollowingSafelyModel> fetchFollowingSafelyData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return FollowingSafelyModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
