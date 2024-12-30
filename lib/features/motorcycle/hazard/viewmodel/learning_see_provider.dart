// provider/hazard_provider.dart
import 'package:flutter/material.dart';

import '../model/learning_hazard.dart';
import '../repo/learning_see_hazard_repo.dart';

class LearningSeeProvider with ChangeNotifier {
  final HazardRepository _repository = HazardRepository();
 // List<LearningHazardModel> _hazardModels = [];
  bool _isLoading = false;
  LearningHazardModel? _hazardModels;

  //List<LearningHazardModel> get LhazardModels => _hazardModels;
 LearningHazardModel? get hazardModels => _hazardModels;
  bool get isLoading => _isLoading;

  // Fetch a single `HazardModel` by document ID
  Future<void> fetchModel(String collectionName, String docId) async {
    _isLoading = true;
    notifyListeners();

    final model = await _repository.fetchModel(collectionName, docId);

    if (model != null) {
      _hazardModels = model; // Replace the list with the single model
    } else {
      _hazardModels = model; // Clear if no model is found
    }

    _isLoading = false;
    notifyListeners();
  }

  // // Fetch all documents from the collection as `HazardModel`
  // Future<void> fetchAllModels(String collectionName) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   final models = await _repository.fetchAllModels(collectionName);
  //
  //   _hazardModels = models;
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }

  // // Add a new `HazardModel` document to Firestore
  // Future<void> addModel(String collectionName, LearningHazardModel model) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   final success = await _repository.addModel(collectionName, model);
  //
  //   if (success) {
  //     _hazardModels.add(model); // Optionally add the new model to the list
  //   }
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }

  // Update an existing document in Firestore
  // Future<void> updateModel(
  //     String collectionName, String docId, LearningHazardModel model) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   final success = await _repository.updateModel(collectionName, docId, model);
  //
  //   if (success) {
  //     final index = _hazardModels.indexWhere((item) => item.title == docId);
  //     if (index != -1) {
  //       _hazardModels[index] = model;
  //     }
  //   }
  //
  //   _isLoading = false;
  //   notifyListeners();
//   // }
//
//   // Delete a document from Firestore
//   Future<void> deleteModel(String collectionName, String docId) async {
//     _isLoading = true;
//     notifyListeners();
//
//     final success = await _repository.deleteModel(collectionName, docId);
//
//     if (success) {
//       _hazardModels.removeWhere((item) => item.title == docId);
//     }
//
//     _isLoading = false;
//     notifyListeners();
//   }
 }
