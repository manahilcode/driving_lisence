import 'package:flutter/material.dart';

import '../model/help_those_involved_model.dart';
import '../repo/help_those_involved_repo.dart';

class HighwayCodeHelpInvolvedProvider with ChangeNotifier {
  final HighwayCodeHelpInvolvedRepository _repository = HighwayCodeHelpInvolvedRepository();
  HighwayCodeHelpInvolved? _document;
  bool _isLoading = true;
  String _error = '';

  HighwayCodeHelpInvolved? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  HighwayCodeHelpInvolvedProvider() {
    fetchHelpInvolvedDocument();
  }

  Future<void> fetchHelpInvolvedDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getHelpInvolvedDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Help those involved document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
