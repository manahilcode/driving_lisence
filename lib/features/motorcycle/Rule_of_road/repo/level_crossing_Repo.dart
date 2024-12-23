import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/level_crossig.dart';

class LevelCrossingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<LevelCrossingModel?> fetchLevelCrossingData(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return LevelCrossingModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch level crossing data: $e');
    }
  }
}