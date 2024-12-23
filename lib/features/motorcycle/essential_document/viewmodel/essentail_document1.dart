import 'package:flutter/material.dart';

import '../model/seential_document1.dart';
import '../repo/essentail_document1.dart';

class EssentialDocumentsDetailsNotifier extends ChangeNotifier {
  final EssentialDocumentsDetailsRepository _repository;

  EssentialDocumentsDetailsNotifier(this._repository);

  // State variables
  EssentialDocumentsDetails? _details;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  EssentialDocumentsDetails? get details => _details;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Method to fetch data
  Future<void> fetchEssentialDocumentsDetails(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _details = await _repository.fetchEssentialDocumentsDetails(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
