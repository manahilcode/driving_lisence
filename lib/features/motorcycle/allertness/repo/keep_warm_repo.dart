import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/keep_warm_model.dart';

class KeepingWarmRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<KeepingWarmModel> fetchKeepingWarmData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return KeepingWarmModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
