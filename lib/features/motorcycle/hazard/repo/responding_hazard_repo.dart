import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/repoding_hazard.dart';

class RespondingToHazardsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to fetch a single RespondingToHazards document by its ID
  Future<RespondingToHazards?> fetchRespondingToHazards(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('respondingToHazards').doc(documentId).get();
      if (snapshot.exists) {
        return RespondingToHazards.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch document: $e');
    }
  }
}