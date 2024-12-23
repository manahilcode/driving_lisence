import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/crossroad.dart';

class RidingGuideRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CrossroadRule> getRidingGuideData() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('motorcycle_riding')
          .doc('Crossroads_and_Roundabouts')
          .get();
      if (doc.exists) {
        return CrossroadRule.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Data not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
