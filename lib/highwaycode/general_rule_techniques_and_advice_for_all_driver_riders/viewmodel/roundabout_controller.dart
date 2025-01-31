import 'package:flutter/material.dart';

import '../model/roundabout_model.dart';
import '../repo/roundabout_repo.dart';

class HighwayRoundaboutsProvider extends ChangeNotifier {
  final HighwayRoundaboutsRepository _repository = HighwayRoundaboutsRepository();

  HighwayRoundabouts? _highwayRoundaboutsData;
  HighwayRoundabouts? get highwayRoundaboutsData => _highwayRoundaboutsData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayRoundaboutsData = await _repository.fetchHighwayRoundaboutsData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
