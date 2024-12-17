import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/what_if_model.dart';

class WhatIfRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch a single `WhatIfModel` by document ID.
  Future<WhatIfModel?> fetchModel(String collectionName, String docId) async {
    try {
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collectionName).doc(docId).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return WhatIfModel.fromMap(data);
      } else {
        print('Document not found in $collectionName with ID $docId.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  /// Fetch all documents from the collection as `WhatIfModel`.
  Future<List<WhatIfModel>> fetchAllModels(String collectionName) async {
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection(collectionName).get();

      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return WhatIfModel.fromMap(data);
      }).toList();
    } catch (e) {
      print('Error fetching documents: $e');
      return [];
    }
  }

  /// Add a new `WhatIfModel` document to Firestore.
  Future<bool> addModel(String collectionName, WhatIfModel model) async {
    try {
      await _firestore.collection(collectionName).add(model.toMap());
      return true;
    } catch (e) {
      print('Error adding document: $e');
      return false;
    }
  }

  /// Update an existing document in Firestore.
  Future<bool> updateModel(
      String collectionName, String docId, WhatIfModel model) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(docId)
          .update(model.toMap());
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
