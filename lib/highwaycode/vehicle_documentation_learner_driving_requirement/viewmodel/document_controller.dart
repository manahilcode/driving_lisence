import 'package:flutter/material.dart';

import '../../introduction/repo/wording_of_highway_code_repo.dart';
import '../model/document_model.dart';
import '../repo/document_repo.dart';

class HighwayCodeProvider2211 with ChangeNotifier {
  final HighwayCodeRepository1122 _repository = HighwayCodeRepository1122();
  HighwayCodeDocument1122? _documents;
  bool _isLoading = true;
  String _error = '';

  HighwayCodeDocument1122? get documents => _documents;
  bool get isLoading => _isLoading;
  String get error => _error;

  HighwayCodeProvider() {
    fetchDocuments();
  }

  Future<void> fetchDocuments() async {
    _isLoading = true;
    notifyListeners();

    try {
      _documents = await _repository.getDocuments();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load documents';
      _isLoading = false;
    }

    notifyListeners();
  }
}
