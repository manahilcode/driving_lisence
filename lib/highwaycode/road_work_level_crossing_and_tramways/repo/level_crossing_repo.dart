import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/level_crossing_model.dart';

class HighwayLevelCrossingsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayLevelCrossingsModel> fetchHighwayLevelCrossing() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Road_works_level_crossings_and_tramways")
          .doc('Level crossings')
          .get();

      if (docSnapshot.exists) {
        return HighwayLevelCrossingsModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
