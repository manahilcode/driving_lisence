import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/seeing_hazard_model.dart';

class SeeingHazardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch a single `SeeingHazardModel` by document ID.
  Future<SeeingHazardModel?> fetchModel(String collectionName, String docId) async {
    try {
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collectionName).doc(docId).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return SeeingHazardModel.fromJson(data);
      } else {
        print('Document not found in $collectionName with ID $docId.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  /// Fetch all documents from the collection as `SeeingHazardModel`.
  Future<List<SeeingHazardModel>> fetchAllModels(String collectionName) async {
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection(collectionName).get();

      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return SeeingHazardModel.fromJson(data);
      }).toList();
    } catch (e) {
      print('Error fetching documents: $e');
      return [];
    }
  }

  /// Add a new `SeeingHazardModel` document to Firestore.
  Future<bool> addModel(String collectionName, SeeingHazardModel model) async {
    try {
      await _firestore.collection(collectionName).add(model.toJson());
      return true;
    } catch (e) {
      print('Error adding document: $e');
      return false;
    }
  }

  /// Update an existing document in Firestore.
  Future<bool> updateModel(
      String collectionName, String docId, SeeingHazardModel model) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(docId)
          .update(model.toJson());
      return true;
    } catch (e) {
      print('Error updating document: $e');
      return false;
    }
  }

  /// Delete a document from Firestore.
  Future<bool> deleteModel(String collectionName, String docId) async {
    try {
      await _firestore.collection(collectionName).doc(docId).delete();
      return true;
    } catch (e) {
      print('Error deleting document: $e');
      return false;
    }
  }
}
