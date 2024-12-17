import 'package:flutter/material.dart';
import '../model/clue_model.dart';
import '../repo/clue_repo.dart';

class CluesProvider extends ChangeNotifier {
  final CluesRepository _cluesRepository = CluesRepository();
  List<CluesModel> _cluesList = [];
  CluesModel? _clue;
  bool _isLoading = false;
  String _errorMessage = '';

  List<CluesModel> get cluesList => _cluesList;
  CluesModel? get clue => _clue;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  /// Fetch all CluesModel documents from a collection.
  Future<void> fetchAllClues(String collectionName) async {
    _isLoading = true;
    notifyListeners();
    try {
      _cluesList = await _cluesRepository.fetchAllClues(collectionName);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error fetching all clues: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch a single CluesModel by document ID.
  Future<void> fetchClue(String collectionName, String docId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _clue = await _cluesRepository.fetchClue(collectionName, docId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error fetching clue: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Add a new CluesModel document to Firestore.
  Future<bool> addClue(String collectionName, CluesModel cluesModel) async {
    try {
      return await _cluesRepository.addClue(collectionName, cluesModel);
    } catch (e) {
      _errorMessage = 'Error adding clue: $e';
      notifyListeners();
      return false;
    }
  }

  /// Update an existing CluesModel document in Firestore.
  Future<bool> updateClue(String collectionName, String docId, CluesModel cluesModel) async {
    try {
      return await _cluesRepository.updateClue(collectionName, docId, cluesModel);
    } catch (e) {
      _errorMessage = 'Error updating clue: $e';
      notifyListeners();
      return false;
    }
  }

  /// Delete a CluesModel document from Firestore.
  Future<bool> deleteClue(String collectionName, String docId) async {
    try {
      return await _cluesRepository.deleteClue(collectionName, docId);
    } catch (e) {
      _errorMessage = 'Error deleting clue: $e';
      notifyListeners();
      return false;
    }
  }
}
