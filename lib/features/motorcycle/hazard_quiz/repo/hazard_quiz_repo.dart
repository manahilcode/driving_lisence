import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/hazard_quiz.dart';

class HazardQuizRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch a single `HazardQuiz` by document ID.
  Future<HazardQuiz?> fetchQuiz(String collectionName, String docId) async {
    try {
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collectionName).doc(docId).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return HazardQuiz.fromMap(data);
      } else {
        print('Document not found in $collectionName with ID $docId.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  /// Fetch all documents from the collection as `HazardQuiz` models.
  Future<List<HazardQuiz>> fetchAllQuizzes(String collectionName) async {
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection(collectionName).get();

      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return HazardQuiz.fromMap(data);
      }).toList();
    } catch (e) {
      print('Error fetching documents: $e');
      return [];
    }
  }

  /// Add a new `HazardQuiz` document to Firestore.
  Future<bool> addQuiz(String collectionName, HazardQuiz quiz) async {
    try {
      await _firestore.collection(collectionName).add(quiz.toMap());
      return true;
    } catch (e) {
      print('Error adding document: $e');
      return false;
    }
  }

  /// Update an existing `HazardQuiz` document in Firestore.
  Future<bool> updateQuiz(
      String collectionName, String docId, HazardQuiz quiz) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(docId)
          .update(quiz.toMap());
      return true;
    } catch (e) {
      print('Error updating document: $e');
      return false;
    }
  }

  /// Delete a `HazardQuiz` document from Firestore.
  Future<bool> deleteQuiz(String collectionName, String docId) async {
    try {
      await _firestore.collection(collectionName).doc(docId).delete();
      return true;
    } catch (e) {
      print('Error deleting document: $e');
      return false;
    }
  }
}
