import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/animals.dart'; // Replace with correct path

class AnimalVulnerableUserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<AnimalVulnerableUser> fetchAnimalVulnerableUserData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Vulnerable_road_users').doc(documentId).get();
      if (doc.exists) {
        return AnimalVulnerableUser.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
