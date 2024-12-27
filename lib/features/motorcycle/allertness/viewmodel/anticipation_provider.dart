import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/anticipation_model.dart';
import '../repo/anticipation_repo.dart';

class AnticipationProvider extends ChangeNotifier {
  final RoadAwarenessRepository _repository;
  AnticipationModel? _data;
  bool _isLoading = false;
  String? _error;

  AnticipationProvider(this._repository);

  AnticipationModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchRoadAwarenessData(String collection, String document) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _data = await _repository.fetchRoadAwarenessData(collection, document);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllDocuments(String collectionName) async {
    try {
      // Reference the collection
      CollectionReference collection = FirebaseFirestore.instance.collection(collectionName);

      // Get all documents in the collection
      QuerySnapshot querySnapshot = await collection.get();

      // Iterate over the documents
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        print('Document ID: ${doc.id}');
        print('Data: ${doc.data()}');
      }
    } catch (e) {
      print('Error fetching documents: $e');
    }
  }
}
