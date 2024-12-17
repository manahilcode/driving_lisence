import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/what_if_model.dart';

class WhatIfProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<WhatIfModel> _whatIfModels = [];
  bool _isLoading = false;

  List<WhatIfModel> get whatIfModels => _whatIfModels;
  bool get isLoading => _isLoading;

  /// Fetch a single `WhatIfModel` by document ID.
  Future<WhatIfModel?> fetchModel(String collectionName, String docId) async {
    try {
      _isLoading = true;
      notifyListeners();

      DocumentSnapshot docSnapshot = await _firestore.collection(collectionName).doc(docId).get();

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
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch all documents from the collection as `WhatIfModel`.
  Future<void> fetchAllModels(String collectionName) async {
    try {
      _isLoading = true;
      notifyListeners();

      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();

      _whatIfModels = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return WhatIfModel.fromMap(data);
      }).toList();
    } catch (e) {
      print('Error fetching documents: $e');
      _whatIfModels = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Add a new `WhatIfModel` document to Firestore.
  Future<bool> addModel(String collectionName, WhatIfModel model) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _firestore.collection(collectionName).add(model.toMap());
      return true;
    } catch (e) {
      print('Error adding document: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Update an existing document in Firestore.
  Future<bool> updateModel(String collectionName, String docId, WhatIfModel model) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _firestore.collection(collectionName).doc(docId).update(model.toMap());
      return true;
    } catch (e) {
      print('Error updating document: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Delete a document from Firestore.
  Future<bool> deleteModel(String collectionName, String docId) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _firestore.collection(collectionName).doc(docId).delete();
      return true;
    } catch (e) {
      print('Error deleting document: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
