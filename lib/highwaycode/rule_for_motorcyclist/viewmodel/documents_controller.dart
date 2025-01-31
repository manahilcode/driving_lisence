import 'package:flutter/material.dart';

import '../model/documents_model.dart';
import '../repo/documents_repo.dart';

class HighwayDocumentProvider11 with ChangeNotifier {
  final HighwayDocumentRepository _repository = HighwayDocumentRepository();

  HighwayDocumentModel? _highwayDocument;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayDocumentModel? get highwayDocument => _highwayDocument;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayDocument() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayDocument = await _repository.fetchHighwayDocument();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
