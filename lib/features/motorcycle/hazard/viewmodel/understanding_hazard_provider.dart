import 'package:flutter/material.dart';

import '../model/understand_hazard.dart';
import '../repo/understand_hazar_repo.dart';

class UnderstandingHazardsProvider with ChangeNotifier {
  final UnderstandingHazardsRepository _repository = UnderstandingHazardsRepository();

  UnderstandingHazardsModel? _understandingHazard;
  List<UnderstandingHazardsModel> _understandingHazards = [];
  bool _isLoading = false;
  String? _error;

  UnderstandingHazardsModel? get understandingHazard => _understandingHazard;
  List<UnderstandingHazardsModel> get understandingHazards => _understandingHazards;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Set loading state
  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  // Set the fetched single understanding hazard
  void setUnderstandingHazard(UnderstandingHazardsModel? hazard) {
    _understandingHazard = hazard;
    notifyListeners();
  }

  // Set the list of understanding hazards
  void setUnderstandingHazards(List<UnderstandingHazardsModel> hazards) {
    _understandingHazards = hazards;
    notifyListeners();
  }

  // Set error state
  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // Fetch a single understanding hazard by collection and doc ID
  Future<void> fetchUnderstandingHazard(String collectionName, String docId) async {
    setLoading(true);
    try {
      final hazard = await _repository.fetchModel(collectionName, docId);
      if (hazard != null) {
        setUnderstandingHazard(hazard);
      } else {
        setError('Hazard not found.');
      }
    } catch (e) {
      setError('Error fetching understanding hazard: $e');
    } finally {
      setLoading(false);
    }
  }

  // Fetch all understanding hazards
  Future<void> fetchAllUnderstandingHazards(String collectionName) async {
    setLoading(true);
    try {
      final hazards = await _repository.fetchAllModels(collectionName);
      setUnderstandingHazards(hazards);
    } catch (e) {
      setError('Error fetching understanding hazards: $e');
    } finally {
      setLoading(false);
    }
  }

  // Add a new understanding hazard
  Future<void> addUnderstandingHazard(String collectionName, UnderstandingHazardsModel model) async {
    try {
      final result = await _repository.addModel(collectionName, model);
      if (result) {
        fetchAllUnderstandingHazards(collectionName); // Refresh the list
      }
    } catch (e) {
      setError('Error adding understanding hazard: $e');
    }
  }

  // Update an existing understanding hazard
  Future<void> updateUnderstandingHazard(String collectionName, String docId, UnderstandingHazardsModel model) async {
    try {
      final result = await _repository.updateModel(collectionName, docId, model);
      if (result) {
        fetchUnderstandingHazard(collectionName, docId); // Refresh the specific hazard
      }
    } catch (e) {
      setError('Error updating understanding hazard: $e');
    }
  }

  // Delete an understanding hazard
  Future<void> deleteUnderstandingHazard(String collectionName, String docId) async {
    try {
      final result = await _repository.deleteModel(collectionName, docId);
      if (result) {
        fetchAllUnderstandingHazards(collectionName); // Refresh the list after deletion
      }
    } catch (e) {
      setError('Error deleting understanding hazard: $e');
    }
  }
}