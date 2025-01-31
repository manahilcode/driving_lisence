import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/on_the_road_model.dart';

class HighwayCode11Repo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCode11> getHighwayCode11Data() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection("highwaycode_Rules_for_users_wheelchairs_scooters")
          .doc('On the road').get();

      if (doc.exists) {
        return HighwayCode11.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
