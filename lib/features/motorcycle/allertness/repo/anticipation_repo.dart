import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/anticipation_model.dart';

class RoadAwarenessRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AnticipationModel> fetchRoadAwarenessData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return AnticipationModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}