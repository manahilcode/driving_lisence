import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/clue_model.dart';

class CluesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch a single CluesModel by document ID.
  Future<CluesModel?> fetchClue(String collectionName, String docId) async {
    try {
      // Fetch the document from Firestore
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collectionName).doc(docId).get();

      if (docSnapshot.exists) {
        // Map the document data to CluesModel
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return CluesModel.fromJson(data);
      } else {
        print('Document not found in $collectionName with ID $docId.');
        return null;
      }
    } catch (e) {
      print('Error fetching Clue: $e');
      return null;
    }
  }

  /// Fetch all CluesModel documents from a collection.
  Future<List<CluesModel>> fetchAllClues(String collectionName) async {
    try {
      // Fetch all documents from the collection
      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();

      // Map each document to a CluesModel
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return CluesModel.fromJson(data);
      }).toList();
    } catch (e) {
      print('Error fetching all Clues: $e');
      return [];
    }
  }

  /// Add a new CluesModel document to Firestore.
  Future<bool> addClue(String collectionName, CluesModel cluesModel) async {
    try {
      await _firestore.collection(collectionName).add(cluesModel.toJson());
      return true;
    } catch (e) {
      print('Error adding Clue: $e');
      return false;
    }
  }

  /// Update an existing CluesModel document in Firestore.
  Future<bool> updateClue(
      String collectionName, String docId, CluesModel cluesModel) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(docId)
          .update(cluesModel.toJson());
      return true;
    } catch (e) {
      print('Error updating Clue: $e');
      return false;
    }
  }

  /// Delete a CluesModel document from Firestore.
  Future<bool> deleteClue(String collectionName, String docId) async {
    try {
      await _firestore.collection(collectionName).doc(docId).delete();
      return true;
    } catch (e) {
      print('Error deleting Clue: $e');
      return false;
    }
  }
}
