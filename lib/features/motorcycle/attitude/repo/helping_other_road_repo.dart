import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/helping_other_road_model.dart';

class HelpingOtherRoadRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HelpingOtherRoadModel> fetchDazzleData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return HelpingOtherRoadModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
