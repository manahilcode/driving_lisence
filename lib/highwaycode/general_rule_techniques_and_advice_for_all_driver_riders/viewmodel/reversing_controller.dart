import 'package:flutter/material.dart';

import '../model/reversing_model.dart';
import '../repo/reversing_repo.dart';

class HighwayReversingProvider extends ChangeNotifier {
  final HighwayReversingRepository _repository = HighwayReversingRepository();

  HighwayReversing? _highwayReversingData;
  HighwayReversing? get highwayReversingData => _highwayReversingData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayReversingData = await _repository.fetchHighwayReversingData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
