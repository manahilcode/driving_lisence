import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/being_seen_by_other_model.dart';

class BeingSeenRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<BeingSeenModel> fetchBeingSeenData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return BeingSeenModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
