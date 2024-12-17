// provider/looking_but_not_seeing_provider.dart
import 'package:flutter/material.dart';
import '../model/looking_not_seeing.dart';
import '../repo/looking_seeing_repo.dart';

class LookingButNotSeeingProvider with ChangeNotifier {
  final LookingButNotSeeingRepository _repository = LookingButNotSeeingRepository();

  List<LookingButNotSeeingModel> _lookingModels = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<LookingButNotSeeingModel> get lookingModels => _lookingModels;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  /// Fetch a single LookingButNotSeeingModel by document ID
  Future<void> fetchLookingButNotSeeing(String collectionName, String docName) async {
    _isLoading = true;
    _errorMessage = '';  // Clear any previous errors
    notifyListeners();

    try {
      final model = await _repository.fetchLookingButNotSeeing(collectionName, docName);
      if (model != null) {
        _lookingModels = [model];  // Update with the single model
      } else {
        _lookingModels = [];  // Clear if not found
        _errorMessage = 'Document not found';
      }
    } catch (e) {
      _errorMessage = 'Error fetching model: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch all LookingButNotSeeingModel documents from the collection
  Future<void> fetchAllLookingButNotSeeing(String collectionName) async {
    _isLoading = true;
    _errorMessage = '';  // Clear any previous errors
    notifyListeners();

    try {
      final models = await _repository.fetchAllLookingButNotSeeing(collectionName);
      _lookingModels = models;
    } catch (e) {
      _errorMessage = 'Error fetching all models: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
