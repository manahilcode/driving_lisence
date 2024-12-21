import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/discusstion_practice_model.dart'; // Replace with the correct path

class DiscussionPracticeRepositoryVal {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<DiscussionPracticeVal> fetchDiscussionPracticeData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('discussion_practice').doc(documentId).get();
      if (doc.exists) {
        return DiscussionPracticeVal.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
