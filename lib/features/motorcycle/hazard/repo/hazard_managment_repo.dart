import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/hazard_managment_model.dart';

class HazardManagementRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to fetch a single hazard document by its ID
  Future<HazardManagement?> fetchHazard(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection("motorcycle_responding_hazard").doc(documentId).get();
      if (snapshot.exists) {
        return HazardManagement.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Hazard not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch hazard: $e');
    }
  }
}