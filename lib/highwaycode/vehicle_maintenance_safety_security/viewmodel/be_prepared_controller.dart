import 'package:flutter/material.dart';

import '../model/be_prepared_model.dart';
import '../repo/be_prepared_repo.dart';

class HighwayBePreparedProvider with ChangeNotifier {
  final HighwayBePreparedRepository _repository = HighwayBePreparedRepository();
  HighwayBePrepared? _document;
  bool _isLoading = true;
  String _error = '';

  HighwayBePrepared? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  HighwayBePreparedProvider() {
    fetchBePreparedDocument();
  }

  Future<void> fetchBePreparedDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getBePreparedDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Be Prepared document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
