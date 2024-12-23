import 'package:flutter/material.dart';
import '../model/essential_document.dart';
import '../repo/essential_document.dart';

class EssentialDocumentsNotifier extends ChangeNotifier {
  final EssentialDocumentsRepository _repository;

  EssentialDocumentsNotifier(this._repository);

  // State variables
  EssentialDocumentsEss? _essentialDocuments;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  EssentialDocumentsEss? get essentialDocuments => _essentialDocuments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Method to fetch data
  Future<void> fetchEssentialDocuments(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _essentialDocuments =
      await _repository.fetchEssentialDocuments(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
