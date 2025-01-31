import 'package:flutter/material.dart';

import '../model/road_works_model.dart';
import '../repo/road_works_repo.dart';

class HighwaycodeRoadWorksProvider with ChangeNotifier {
  final HighwaycodeRoadWorksRepository _repository = HighwaycodeRoadWorksRepository();
  HighwaycodeRoadWorksModel? _roadWorksData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwaycodeRoadWorksModel? get roadWorksData => _roadWorksData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwaycodeRoadWorksData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _roadWorksData = await _repository.fetchHighwaycodeRoadWorksData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
