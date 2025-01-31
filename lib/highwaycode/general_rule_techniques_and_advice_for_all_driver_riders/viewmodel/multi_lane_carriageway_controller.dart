import 'package:flutter/material.dart';

import '../model/multi_lane_carriageway_model.dart';
import '../repo/multi_lane_carriageway_repo.dart';

class MultiLaneCarriagewaysProvider extends ChangeNotifier {
  final MultiLaneCarriagewaysRepository _repository = MultiLaneCarriagewaysRepository();

  MultiLaneCarriageways? _multiLaneCarriagewaysData;
  MultiLaneCarriageways? get multiLaneCarriagewaysData => _multiLaneCarriagewaysData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _multiLaneCarriagewaysData = await _repository.fetchMultiLaneCarriagewaysData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
