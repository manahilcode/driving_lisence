// Provider class for HighwayUsingRoad
import 'package:flutter/material.dart';

import '../model/using_the_road_model.dart';
import '../repo/using_the_road_repo.dart';

class HighwayUsingRoadProvider extends ChangeNotifier {
  final HighwayUsingRoadRepository _repository = HighwayUsingRoadRepository();

  HighwayUsingRoad? _highwayUsingRoad;
  HighwayUsingRoad? get highwayUsingRoad => _highwayUsingRoad;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchHighwayUsingRoad(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayUsingRoad = await _repository.fetchHighwayUsingRoadData(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}