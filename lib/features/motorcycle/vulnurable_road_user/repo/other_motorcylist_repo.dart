import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/other_Motorcyclist.dart'; // Replace with the correct path

class OtherMotorcyclistsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<OtherMotorcyclists> fetchOtherMotorcyclistsData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Vulnerable_road_users').doc(documentId).get();
      if (doc.exists) {
        return OtherMotorcyclists.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
