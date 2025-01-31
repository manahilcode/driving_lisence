import 'package:flutter/material.dart';

import '../model/overtaking_model.dart';
import '../repo/overtaking_repo.dart';

class HighwayOvertakingProvider extends ChangeNotifier {
  final HighwayOvertakingRepository _repository = HighwayOvertakingRepository();

  HighwayOvertaking? _highwayOvertakingData;
  HighwayOvertaking? get highwayOvertakingData => _highwayOvertakingData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayOvertakingData = await _repository.fetchHighwayOvertakingData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
