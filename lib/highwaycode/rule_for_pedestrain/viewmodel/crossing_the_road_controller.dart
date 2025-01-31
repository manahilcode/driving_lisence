import 'package:flutter/material.dart';

import '../model/crossing_model.dart';
import '../model/crossing_the_road_model.dart';
import '../repo/crossing_repo.dart';
import '../repo/crossing_the_road_repo.dart';

class HighwayCrossingRoadProvider with ChangeNotifier {
  final HighwayCrossingRepository11 _repository = HighwayCrossingRepository11();

  HighwayCrossingModel? _highwayCrossingData;
  HighwayCrossingModel? get highwayCrossingData => _highwayCrossingData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchHighwayCrossingData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayCrossingData = await _repository.fetchHighwayCrossingData();
    } catch (e) {
      // Handle error if necessary
      _highwayCrossingData = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}