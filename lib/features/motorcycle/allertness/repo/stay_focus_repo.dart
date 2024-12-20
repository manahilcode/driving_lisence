import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/stay_focus_model.dart';

class StayFocusRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<StayFocusModel> fetchFocusedRidingData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return StayFocusModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
