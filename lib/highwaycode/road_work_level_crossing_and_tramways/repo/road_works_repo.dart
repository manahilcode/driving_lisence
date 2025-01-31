import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/road_works_model.dart';

class HighwaycodeRoadWorksRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwaycodeRoadWorksModel> fetchHighwaycodeRoadWorksData() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Road_works_level_crossings_and_tramways")
          .doc('Road works')
          .get();

      if (docSnapshot.exists) {
        return HighwaycodeRoadWorksModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
