import 'package:flutter/material.dart';

import '../model/deal_with_danger_model.dart';
import '../repo/deal_with_danger_repo.dart';

class HighwayCodeDealWithDangerProvider with ChangeNotifier {
  final HighwayCodeDealWithDangerRepository _repository = HighwayCodeDealWithDangerRepository();
  HighwayCodeDealWithDanger? _document;
  bool _isLoading = true;
  String _error = '';

  HighwayCodeDealWithDanger? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  HighwayCodeDealWithDangerProvider() {
    fetchDealWithDangerDocument();
  }

  Future<void> fetchDealWithDangerDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getDealWithDangerDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Deal with Danger document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
