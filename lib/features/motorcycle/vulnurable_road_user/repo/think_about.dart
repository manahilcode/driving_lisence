import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_About.dart'; // Replace with the correct path

class DiscussionQuestionsRepositoryVal {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<DiscussionQuestionsval> fetchDiscussionQuestionsData(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('discussion_questions').doc(documentId).get();
      if (doc.exists) {
        return DiscussionQuestionsval.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
