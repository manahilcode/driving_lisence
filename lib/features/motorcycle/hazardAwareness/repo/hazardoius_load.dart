import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/hazardoius_load.dart'; // Replace with the correct path

class HazardousLoadRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<HazardousLoad> fetchHazardousLoadData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('hazardous_loads').doc(documentId).get();
      if (doc.exists) {
        return HazardousLoad.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
