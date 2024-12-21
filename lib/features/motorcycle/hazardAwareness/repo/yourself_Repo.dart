import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/yourself.dart'; // Replace with correct import

class AwarenessHazardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<AwarenessHazardYourself> fetchAwarenessHazardData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('awareness_hazards').doc(documentId).get();
      if (doc.exists) {
        return AwarenessHazardYourself.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
