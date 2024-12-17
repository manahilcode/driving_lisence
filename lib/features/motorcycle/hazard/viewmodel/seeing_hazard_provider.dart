import 'package:flutter/cupertino.dart';

import '../model/seeing_hazard_model.dart';
import '../repo/seeing_hazard_repo.dart';

class SeeingHazardProvider with ChangeNotifier {
  final SeeingHazardRepository _repository = SeeingHazardRepository();

  List<SeeingHazardModel> _models = [];
  SeeingHazardModel? _model;
  bool _isLoading = false;
  String? _error;

  List<SeeingHazardModel> get models => _models;
  SeeingHazardModel? get model => _model;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Set loading state
  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  // Set the list of models
  void setModels(List<SeeingHazardModel> models) {
    _models = models;
    notifyListeners();
  }

  // Set the single model
  void setModel(SeeingHazardModel model) {
    _model = model;
    notifyListeners();
  }

  // Set error state
  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // Fetch a single model by docId
  Future<void> fetchModel(String collectionName, String docId) async {
    setLoading(true);
    try {
      final fetchedModel = await _repository.fetchModel(collectionName, docId);
      if (fetchedModel != null) {
        setModel(fetchedModel);
      } else {
        setError('Model not found.');
      }
    } catch (e) {
      setError('Error fetching model: $e');
    } finally {
      setLoading(false);
    }
  }

  // Fetch all models from the collection
  Future<void> fetchAllModels(String collectionName) async {
    setLoading(true);
    try {
      final fetchedModels = await _repository.fetchAllModels(collectionName);
      setModels(fetchedModels);
    } catch (e) {
      setError('Error fetching models: $e');
    } finally {
      setLoading(false);
    }
  }

  // Add a new model
  Future<void> addModel(String collectionName, SeeingHazardModel model) async {
    try {
      final success = await _repository.addModel(collectionName, model);
      if (success) {
        fetchAllModels(collectionName);  // Refresh the list after adding
      } else {
        setError('Error adding model');
      }
    } catch (e) {
      setError('Error adding model: $e');
    }
  }

  // Update an existing model
  Future<void> updateModel(String collectionName, String docId, SeeingHazardModel model) async {
    try {
      final success = await _repository.updateModel(collectionName, docId, model);
      if (success) {
        fetchAllModels(collectionName);  // Refresh the list after updating
      } else {
        setError('Error updating model');
      }
    } catch (e) {
      setError('Error updating model: $e');
    }
  }

  // Delete a model
  Future<void> deleteModel(String collectionName, String docId) async {
    try {
      final success = await _repository.deleteModel(collectionName, docId);
      if (success) {
        fetchAllModels(collectionName);  // Refresh the list after deleting
      } else {
        setError('Error deleting model');
      }
    } catch (e) {
      setError('Error deleting model: $e');
    }
  }
}