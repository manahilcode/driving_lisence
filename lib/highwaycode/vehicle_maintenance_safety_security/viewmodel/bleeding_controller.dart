import 'package:flutter/material.dart';

import '../model/bleeding_model.dart';
import '../repo/bleeding_repo.dart';

class HighwayBleedingProvider with ChangeNotifier {
  final HighwayBleedingRepository _repository = HighwayBleedingRepository();
  HighwayBleeding? _document;
  bool _isLoading = true;
  String _error = '';

  HighwayBleeding? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  HighwayBleedingProvider() {
    fetchBleedingDocument();
  }

  Future<void> fetchBleedingDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getBleedingDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Bleeding document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
