import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/vulnurable_user.dart'; // Replace with the correct path

class VulnerableRoadUsersRepositoryval {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<VulnerableRoadUsersVal> fetchVulnerableRoadUsersData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('vulnerable_road_users').doc(documentId).get();
      if (doc.exists) {
        return VulnerableRoadUsersVal.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
