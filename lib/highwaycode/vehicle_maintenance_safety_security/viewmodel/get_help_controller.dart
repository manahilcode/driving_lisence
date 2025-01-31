import 'package:flutter/material.dart';

import '../model/get_help_model.dart';
import '../repo/get_help_repo.dart';

class HighwayGetHelpProvider with ChangeNotifier {
  final HighwayGetHelpRepository _repository = HighwayGetHelpRepository();
  HighwayGetHelp? _document;
  bool _isLoading = true;
  String _error = '';

  HighwayGetHelp? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  HighwayGetHelpProvider() {
    fetchGetHelpDocument();
  }

  Future<void> fetchGetHelpDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getGetHelpDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Get Help document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
