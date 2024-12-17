import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/your_model.dart';
import '../repo/your_model.dart';

class MotorcycleYourProvider with ChangeNotifier {
  final MotorcycleYourRepository _repository = MotorcycleYourRepository();
  List<MotorcycleAnswerModel> _motorcycleAnswers = [];
  bool _isLoading = false;

  List<MotorcycleAnswerModel> get motorcycleAnswers => _motorcycleAnswers;
  bool get isLoading => _isLoading;

  /// Fetch a single `MotorcycleAnswerModel` by document ID.
  Future<void> fetchModel(String collectionName, String docId) async {
    _isLoading = true;
    notifyListeners();

    final model = await _repository.fetchModel(collectionName, docId);

    if (model != null) {
      _motorcycleAnswers = [model]; // Replace the current list with the single model
    } else {
      _motorcycleAnswers = []; // Clear the list if no model is found
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Fetch all documents from the collection as `MotorcycleAnswerModel`.
  Future<void> fetchAllModels(String collectionName) async {
    _isLoading = true;
    notifyListeners();

    final models = await _repository.fetchAllModels(collectionName);

    _motorcycleAnswers = models;

    _isLoading = false;
    notifyListeners();
  }

  /// Add a new `MotorcycleAnswerModel` document to Firestore.
  Future<void> addModel(String collectionName, MotorcycleAnswerModel model) async {
    _isLoading = true;
    notifyListeners();

    final success = await _repository.addModel(collectionName, model);

    if (success) {
      // Optionally add the new model to the list if needed
      _motorcycleAnswers.add(model);
    }

    _isLoading = false;
    notifyListeners();
  }

  // /// Update an existing document in Firestore.
  // Future<void> updateModel(String collectionName, String docId, MotorcycleAnswerModel model) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   final success = await _repository.updateModel(collectionName, docId, model);
  //
  //   if (success) {
  //     // Optionally update the local list if needed
  //     final index = _motorcycleAnswers.indexWhere((item) => item.id == docId);
  //     if (index != -1) {
  //       _motorcycleAnswers[index] = model;
  //     }
  //   }
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }

  /// Delete a document from Firestore.
  // Future<void> deleteModel(String collectionName, String docId) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   final success = await _repository.deleteModel(collectionName, docId);
  //
  //   if (success) {
  //     // Optionally remove the model from the local list
  //     _motorcycleAnswers.removeWhere((item) => item.id == docId);
  //   }
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }
}
