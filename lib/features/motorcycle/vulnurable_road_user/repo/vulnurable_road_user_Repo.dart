import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/vulnurable_road_user.dart';

class VulnerableRoadUserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<VulnerableRoadUser12> fetchVulnerableRoadUserData(String documentId) async {
    try {
      log("logged");
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Vulnerable_road_users').doc(documentId).get();
      final data = doc.data() as Map<String,dynamic>;
      log(data.toString());
      if (doc.exists) {
        return VulnerableRoadUser12.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
