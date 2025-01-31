import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/hierarchy_of_road_users_model.dart';

class HierarchyRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<HierarchyOfRoadUsers> fetchHierarchyData() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('highwaycode_introduction')
          .doc('Hierarchy of Road Users')
          .get();

      if (snapshot.exists) {
        return HierarchyOfRoadUsers.fromFirestore(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document does not exist.');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
