import 'package:flutter/material.dart';
import '../model/road_junction_model.dart';
import '../repo/road_junction_repo.dart';

class RoadJunctionsProvider extends ChangeNotifier {
  final HighwayRoadJunctionsRepository _repository = HighwayRoadJunctionsRepository();

  HighwayRoadJunctions? _roadJunctionsData;
  HighwayRoadJunctions? get roadJunctionsData => _roadJunctionsData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _roadJunctionsData = await _repository.fetchRoadJunctionsData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
